class_name GameJoltRequest
extends HTTPRequest
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
const api_url = "https://api.gamejolt.com/api/game/"
const api_version = "v1_2"
const api_game = "?game_id="
var game_id #= "513246"
var game_private_key #= "635bb6bcf9af8253ff9c93516deed4d2"

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
export var _response_label_path: = NodePath()
onready var _response_label = get_node(_response_label_path)
onready var _gj_game_credential: eh_GJGameCredentials = \
		preload("res://addons/eh_jogos_game_jolt_api/gj_game_credentials.res")
### ---------------------------------------

### Built in Engine Methods ---------------
func _ready():
	game_id = _gj_game_credential.game_id
	game_private_key = _gj_game_credential.private_key
	pass

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------
func _get_request_resuls_basic_text(result, response_code, headers) -> String:
	var response_text = "result: %s \n reponse_code: %s \n headers: %s \n"%[
			result, 
			response_code,
			headers,
	]
	return response_text

func _print_dict(dict: Dictionary, base_ident: = 0) -> String:
	var single_ident = " "
	var identation = ""
	var formated_string = ""
	
	for _i in range(base_ident):
		identation += single_ident
	
	for key in dict.keys():
		formated_string += "%s%s: %s \n"%[identation, key, dict[key]]
	
	return formated_string
	
### ---------------------------------------


