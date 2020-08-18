class_name _eh_GJBaseRequest
extends HTTPRequest
# This Class is not to be used directly, rather it is the base class for all of GameJolt's 
# Endpoint Requests. This will contain the base to build urls and manage responses

### Member Variables and Dependencies -----
# signals 
# enums
# constants
const GAME_CREDENTIALS : eh_GJGameCredentials = \
		preload("res://addons/eh_jogos_game_jolt_api/gj_game_credentials.res")
const USER_CREDENTIALS_PATH: String = "res://addons/eh_jogos_game_jolt_api/gj_user_credentials.res"
const API_URL = "https://api.gamejolt.com/api/game/"
const API_VERSION = "v1_2"
const API_GAME_ID_PARAMETER = "?game_id="

# public variables - order: export > normal var > onready 
var game_id: String
var private_key: String
var username: String
var user_token: String

# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	game_id = GAME_CREDENTIALS.game_id
	private_key = GAME_CREDENTIALS.private_key
	_auto_set_user_credentials()

### ---------------------------------------


### Public Methods ------------------------
func set_user_credentials(p_username, p_user_token) -> void:
	username = p_username
	user_token = p_user_token

### ---------------------------------------


### Private Methods -----------------------
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
	if parsed_json.result != null:
		if parsed_json.result.has("response"):
			parsed_dict = parsed_json.result.response
		else:
			if parsed_json.result is Dictionary:
				push_error("Unknown response Dict: %s"%[parsed_json.result])
	
	return parsed_dict


func _print_dict(dict: Dictionary, base_ident: = 0) -> String:
	var identation = "%*s"%[base_ident, " "]
	var formated_string = ""
	
	for key in dict.keys():
		formated_string += "%s%s: %s \n"%[identation, key, dict[key]]
	
	return formated_string


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
	set_user_credentials(user_credentials.username, user_credentials.user_game_token)


func _set_user_credentials_based_on_gj_file(credentials_file: File, credentials_path: String) -> void:
	var success = credentials_file.open(credentials_path,File.READ)
	if success == OK:
		var content = credentials_file.get_as_text()
		var lines = content.split("\n")
		
		set_user_credentials(lines[1], lines[2])
		
		var user_credentials: eh_GJUserCredentials = eh_GJUserCredentials.new(username, user_token)
		ResourceSaver.save(USER_CREDENTIALS_PATH, user_credentials)

### ---------------------------------------


