class_name eh_GJUsersFetchRequest
extends _eh_GJBaseRequest
# This class decribes the Fetch api endpoint https://gamejolt.com/game-api/doc/users/fetch
# It's response is modeled in the custom resource of eh_GJUsersFetchData.gd
#
# It is possible to request data for a single user with `fetch_user` or for multiple users with
# `fetch_users`. These methods return the request Error Code, so that you can check
# if for connection errors.
#
# Each has it's own signal with the response data, so be sure to listen for the corresponding 
# signal.
#
# If the request fails, the signal `gj_request_failed` will be emitted with an error dict 
# as its parameter.

### Member Variables and Dependencies -----
# signals 
signal gj_users_fetch_data_received(array_of_eh_gj_users_fetch_data) # Multi User Request Response
signal gj_user_fetch_data_received(eh_gj_users_fetch_data) # Single User Request Response

# enums
# constants
const URL_ENDPOINT = "/users/"

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready() -> void:
	pass

### ---------------------------------------


### Public Methods ------------------------
# Request for a single user
func fetch_user(p_username: String, is_user_id: bool = false) -> int:
	var url = _get_base_url(URL_ENDPOINT)
	
	if is_user_id:
		url += "&user_id=%s"%[p_username]
	else:
		url += "&username=%s"%[p_username]
	
	url = _get_signed_url(url)
#	print_debug("Request Url: %s"%[url])
	return request(url)


# Request for multiple users
func fetch_users(p_array_of_ids: Array) -> int:
	var url = _get_base_url(URL_ENDPOINT)
	var user_ids: String = str(p_array_of_ids).lstrip("[").rstrip("]").replace(" ","")
	url += "&user_id=%s"%[user_ids]
	url = _get_signed_url(url)
#	print_debug("Request Url: %s"%[url])
	return request(url)

### ---------------------------------------


### Private Methods -----------------------
func _on_request_completed(result: int, code: int, headers: PoolStringArray, body: PoolByteArray) -> void:
	var response_text = _get_request_resuls_basic_text(result, code, headers)
	var body_dict :Dictionary = _get_parsed_dict(body)
	_log_response(response_text, body_dict)
	
	if _was_correctly_parsed(body_dict):
		var success_dict = _get_success_dict(body_dict)
		if body_dict.has("users"):
			var fetch_data: = []
			for user in body_dict.users:
				var data: eh_GJUsersFetchData = eh_GJUsersFetchData.new(
					success_dict.success, 
					success_dict.message, 
					user
				)
				fetch_data.append(data)
			
			if body_dict.users.size() > 1:
				emit_signal("gj_users_fetch_data_received", fetch_data)
			else:
				emit_signal("gj_user_fetch_data_received", fetch_data[0])
		else:
			emit_signal("gj_request_failed", body_dict)
	else:
		emit_signal("gj_request_failed", body_dict)
	
	queue_free()

### ---------------------------------------


