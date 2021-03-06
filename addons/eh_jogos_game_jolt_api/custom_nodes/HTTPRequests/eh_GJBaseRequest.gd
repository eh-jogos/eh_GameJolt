# This Class is not to be used directly, rather it is the base class for all of GameJolt's 
# Endpoint Requests. This contains the base to build urls and manage responses
class_name eh_GJBaseRequest
extends HTTPRequest

### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------

# Signal sent when requests fail. Sends an dictionary with details about the error.
signal gj_request_failed(error_dict)

#--- enums ----------------------------------------------------------------------------------------
#--- constants ------------------------------------------------------------------------------------

# Path where game credentials are saved as a binary file custom resource.
const GAME_CREDENTIALS : String = "res://addons/eh_jogos_game_jolt_api/gj_game_credentials.res"
# Path where user credentials are saved as a binary file custom resource.
const USER_CREDENTIALS_PATH: String = "res://addons/eh_jogos_game_jolt_api/gj_user_credentials.res"
# Base url for api calls.
const API_URL = "https://api.gamejolt.com/api/game/"
# API version to use. Will be added to base url to build request urls.
const API_VERSION = "v1_2"
# Game Parameter string that will be added to all request urls.
const API_GAME_ID_PARAMETER = "?game_id="

#--- public variables - order: export > normal var > onready --------------------------------------

# The game_id in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project Settings
# after enabling the plugin.
var game_id: String
# The game's private_key in Gamejolt. Should be set in the "GameJolt" Tab that appears in Project 
# Settings after enabling the plugin.
var private_key: String
# The player's username. Will be aquired automatically if the game was downloaded through GameJolt's
# client. Otherwise, will be set by a login screen, but player only needs to login once.
var username: String
# The player's game_token. Will be aquired automatically if the game was downloaded through 
# GameJolt's client. Otherwise, will be set by a login screen, but player only needs to login once.
var user_token: String

#--- private variables - order: export > normal var > onready -------------------------------------
### -----------------------------------------------------------------------------------------------

### Built in Engine Methods -----------------------------------------------------------------------

func _ready() -> void:
	connect("request_completed", self, "_on_request_completed")
	
	var game_credentials = load(GAME_CREDENTIALS)
	
	game_id = game_credentials.game_id
	private_key = game_credentials.private_key
	_auto_set_user_credentials()

### -----------------------------------------------------------------------------------------------


### Public Methods --------------------------------------------------------------------------------

### -----------------------------------------------------------------------------------------------


### Private Methods -------------------------------------------------------------------------------

func _on_request_completed(result: int, code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var response_text = _get_request_resuls_basic_text(result, code, headers)
	var body_dict :Dictionary = _get_parsed_dict(body)
	_log_response(response_text, body_dict)


func _get_base_url(endpoint: String) -> String:
	var url = API_URL + API_VERSION + endpoint + API_GAME_ID_PARAMETER + game_id
	return url


func _get_signed_url(url: String) -> String:
	var signature = url + private_key
	url += "&signature=" + signature.sha1_text()
	return url


func _get_request_resuls_basic_text(result, response_code, headers) -> String:
	var response_text = "result: %s \nreponse_code: %s \nheaders: %s \n"%[
			result, 
			response_code,
			headers,
	]
	return response_text


func _get_parsed_dict(body: PoolByteArray) -> Dictionary:
	var parsed_dict: Dictionary = {}
	
	var parsed_json: JSONParseResult = JSON.parse(body.get_string_from_utf8())
	if parsed_json.error == OK:
		if parsed_json.result != null:
			if parsed_json.result.has("response"):
				parsed_dict = parsed_json.result.response
			else:
				if parsed_json.result is Dictionary:
					push_error("Unknown response Dict: %s"%[parsed_json.result])
					parsed_dict = {
						"parse_error": parsed_json.error,
						"parse_error_string": "Unknown response dict",
						"parse_content":parsed_json.result
					}
	else:
		parsed_dict = {
			"parse_error": parsed_json.error,
			"parse_error_string": parsed_json.error_string,
			"parse_content": body.get_string_from_utf8()
		}
	
	return parsed_dict


func _was_correctly_parsed(parsed_dict: Dictionary) -> bool:
	var was_correctly_parsed: = true
	
	if parsed_dict.has("parse_error"):
		was_correctly_parsed = false
	
	return was_correctly_parsed


func _log_response(response_text: String, body_dict: Dictionary) -> void:
	response_text += "body: \n"
	response_text += _print_dict(body_dict, 4)
	print_debug(response_text)


func _print_dict(dict: Dictionary, base_ident: = 0) -> String:
	var identation = "%*s"%[base_ident, " "]
	var formated_string = ""
	
	for key in dict.keys():
		formated_string += "%s%s: %s \n"%[identation, key, dict[key]]
	
	return formated_string


func _get_success_dict(body_dict: Dictionary):
	var success_dict = {
		"success": false,
		"message": ""
	}
	
	if body_dict.has("success"):
		success_dict.success = JSON.parse(body_dict.success).result
	if body_dict.has("message"):
		success_dict.message = body_dict.message
	
	return success_dict


func _auto_set_user_credentials() -> void :
	# This only works if the player downloaded the game through gamejolt's client. 
	# Otherwise they'll have to manually login.
	var credentials_path = ".gj-credentials"
	var credentials_file = File.new()
	
	if ResourceLoader.exists(USER_CREDENTIALS_PATH):
		_set_user_credentials_based_on_resource()
	elif credentials_file.file_exists(credentials_path):
		_set_user_credentials_based_on_gj_file(credentials_file, credentials_path)


func _set_user_credentials_based_on_resource() -> void:
	var user_credentials: eh_GJUserCredentials = ResourceLoader.load(USER_CREDENTIALS_PATH)
	_set_user_credentials(user_credentials.username, user_credentials.user_game_token)


func _set_user_credentials_based_on_gj_file(credentials_file: File, credentials_path: String) -> void:
	var success = credentials_file.open(credentials_path,File.READ)
	if success == OK:
		var content = credentials_file.get_as_text()
		var lines = content.split("\n")
		
		_set_user_credentials(lines[1], lines[2])
		
		var user_credentials: eh_GJUserCredentials = eh_GJUserCredentials.new(username, user_token)
		ResourceSaver.save(USER_CREDENTIALS_PATH, user_credentials)


func _set_user_credentials(p_username, p_user_token) -> void:
	username = p_username
	user_token = p_user_token

### -----------------------------------------------------------------------------------------------
