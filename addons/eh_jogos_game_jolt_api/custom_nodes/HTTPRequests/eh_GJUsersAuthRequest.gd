class_name eh_GJUsersAuthRequest
extends _eh_GJBaseRequest
# This class decribes the Auth api endpoint https://gamejolt.com/game-api/doc/users/auth
# It's response is modeled in the custom resource of eh_GJUsersAuthData.gd
#
# It's a simple class to help with login in the user, but should be the first thing the 
# game does or check for. 
#
# If the request fails, the signal `gj_request_failed` will be emitted with an error dict 
# as its parameter.

### Member Variables and Dependencies -----
# signals 
signal gj_auth_data_received(eh_gj_users_auth_data)

# enums
# constants
const URL_ENDPOINT = "/users/auth/"

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready() -> void:
	pass

### ---------------------------------------


### Public Methods ------------------------
func auth_user_credentials(p_username: String, p_user_token: String) -> int:
	var url = _get_base_url(URL_ENDPOINT)
	url += "&username=%s&user_token=%s"%[p_username, p_user_token]
	url = _get_signed_url(url)
	return request(url)

### ---------------------------------------


### Private Methods -----------------------
func _on_request_completed(result: int, code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var response_text = _get_request_resuls_basic_text(result, code, headers)
	var body_dict :Dictionary = _get_parsed_dict(body)
	_log_response(response_text, body_dict)
	
	if _was_correctly_parsed(body_dict):
		var success_dict = _get_success_dict(body_dict)
		
		var auth_data = eh_GJUsersAuthData.new(success_dict.success, success_dict.message)
		emit_signal("gj_auth_data_received", auth_data)
		
	else:
		emit_signal("gj_request_failed", body_dict)
	
	queue_free()

### ---------------------------------------


