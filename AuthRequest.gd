tool
extends GameJoltRequest
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
export var  _endpoint = "/users/auth/"
var _username: String
var _game_token: String
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	
	var credentials_path = ".gj-credentials"
	var credentials_file = File.new()
	var open_err = credentials_file.open(credentials_path,File.READ)
	if open_err == OK:
		var content = credentials_file.get_as_text()
		var lines = content.split("\n")
		_username = lines[1]
		_game_token = lines[2]
		
		
	pass

### ---------------------------------------


### Public Methods ------------------------
func hello_world():
	print("Hello World!")
### ---------------------------------------


### Private Methods -----------------------
func _on_LoginRequest_request_completed(result, response_code, headers, body: PoolByteArray):
	var response_text = _get_request_resuls_basic_text(result, response_code, headers)
	
	response_text += "body: \n"
	var body_dict :Dictionary = JSON.parse(body.get_string_from_utf8()).result.response
	var success :bool = JSON.parse(body_dict.success).result
	response_text += "    response: %s \n"%[success]
	if not success:
		response_text += "    message: %s"%[body_dict.message]
	
	if _response_label != null:
		_response_label.text = response_text
	else:
		print(response_text)


func _on_Button_pressed():
	var url = api_url+api_version+_endpoint
	url += api_game+game_id
	url += "&username=%s&user_token=%s"%[_username, _game_token] # YpqNpe
	var signature = url+game_private_key
	url += "&signature=" + signature.sha1_text()
	request(url)
### ---------------------------------------


