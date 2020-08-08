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
const game_id = "513246"
const game_private_key = ""

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
export var _response_label_path: = NodePath()
onready var _response_label = get_node(_response_label_path)
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
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


