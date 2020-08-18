class_name eh_GJUsersAuthData
extends Resource
# Data Struct that describes the response from `/users/auth/` endpoint
# Documentation for member variables at https://gamejolt.com/game-api/doc/users/auth/

var success: = false
var message: = ""

func _init(p_success: = false, p_message: = "") -> void:
	success = p_success
	message = p_message


func _to_string() -> String:
	var string: = "success: %s \nmessage: %s"%[success, message]
	return string
