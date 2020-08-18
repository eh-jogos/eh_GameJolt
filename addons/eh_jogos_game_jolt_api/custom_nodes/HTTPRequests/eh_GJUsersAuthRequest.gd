class_name eh_GJUsersAuthRequest
extends _eh_GJBaseRequest
# This class decribes the Auth api endpoint https://gamejolt.com/game-api/doc/users/auth
# It's a simple class to help with login in the user, but should be the first thing the 
# game does or check for. 
# It returns a custom resource (eh_GJUsersAuthData) with: 
#	success: bool - authentication success/failure 
#	message: String - Reason for failure, in case of failure, empty if auth succeded

### Member Variables and Dependencies -----
# signals 
signal gj_auth_data_received(eh_gj_users_auth_data)

# enums
# constants
const URL_ENDPOINT = "/users/auth/"

# public variables - order: export > normal var > onready 
var is_authenticated: = false

# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	connect("request_completed", self, "_on_request_completed")

### ---------------------------------------


### Public Methods ------------------------
func auth_user_credentials(p_username: String, p_user_token: String) -> void:
	var url = _get_base_url(URL_ENDPOINT)
	url += "&username=%s&user_token=%s"%[p_username, p_user_token]
	url = _get_signed_url(url)
	request(url)

### ---------------------------------------


### Private Methods -----------------------
func _get_parsed_dict(body: PoolByteArray) -> Dictionary:
	var parsed_dict: = ._get_parsed_dict(body)
	
	if parsed_dict.has("success"):
		parsed_dict["success"] = JSON.parse(parsed_dict.success).result
	else:
		parsed_dict["success"] = false
	
	if not parsed_dict.has("message"):
		parsed_dict["message"] = ""
	
	return parsed_dict


func _on_request_completed(result: int, code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var response_text = _get_request_resuls_basic_text(result, code, headers)
	var auth_data = eh_GJUsersAuthData.new()
	
	response_text += "body: \n"
	var body_dict :Dictionary = _get_parsed_dict(body)
	response_text += _print_dict(body_dict, 4)
	print_debug(response_text)
	
	auth_data.success = body_dict.success
	auth_data.message = body_dict.message
	emit_signal("gj_auth_data_received", auth_data)
	
	queue_free()

### ---------------------------------------


