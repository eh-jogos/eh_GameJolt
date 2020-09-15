# Data Struct that describes the response from `/users/auth/` endpoint
# Further details at [gamejolt's api documentation](https://gamejolt.com/game-api/doc/users/auth/)
# @category: User/ResponseData
class_name eh_GJUsersAuthData
extends Resource

# Status of the request.
var success: = false
# Will contain error message if request fails.
var message: = ""

func _init(p_success: bool, p_message: String) -> void:
	success = p_success
	message = p_message


func _to_string() -> String:
	var string: = "success: %s \nmessage: %s"%[success, message]
	return string
