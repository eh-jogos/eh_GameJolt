extends GameJoltRequest
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
export var  _endpoint = "/users/"
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------
func _on_LoginRequest_request_completed(result, response_code, headers, body: PoolByteArray):
	var response_text = _get_request_resuls_basic_text(result, response_code, headers)
	
	response_text += "body: \n"
	var body_dict :Dictionary = JSON.parse(body.get_string_from_utf8()).result.response
	var success :bool = JSON.parse(body_dict.success).result
	response_text += "    response: %s \n"%[success]
	if success:
		for user in body_dict.users:
			response_text += "    user: \n"
			response_text += _print_dict(user, 8)
	else:
		response_text += "    message: %s"%[body_dict.message]
	
	_response_label.text = response_text
	pass # Replace with function body.


func _on_FetchButton_pressed():
	var url = api_url+api_version+_endpoint
	url += api_game+game_id
	url += "&username=eh_jogos"
	url += "&signature=" + (url+game_private_key).sha1_text()
	request(url)
### ---------------------------------------
