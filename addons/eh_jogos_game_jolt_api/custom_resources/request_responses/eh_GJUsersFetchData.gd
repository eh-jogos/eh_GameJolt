class_name eh_GJUsersFetchData
extends Resource
# Data Struct that describes the user_response from `/users/` endpoint
# Documentation for member variables at https://gamejolt.com/game-api/doc/users/fetch

enum Type {
	User,
	Developer,
	Moderator,
	Administrator
}

enum Status {
	Active,
	Banned
}

var success: = false
var message: = ""
var id: = 0
var type: int = Type.User
var username: = ""
var avatar_url: = ""
var signed_up: = ""
var signed_up_timestamp: = 0
var last_logged_in: = ""
var last_logged_in_timestamp: = 0
var status: int = Status.Active
var developer_name: = ""
var developer_website: = ""
var developer_description: = ""


func _init(p_success: bool, p_message: String, user_response: Dictionary) -> void:
	success = p_success
	message = p_message
	
	if user_response.has("id"):
		id = JSON.parse(user_response.id).result
	
	if user_response.has("type"):
		var index = Type.keys().find(user_response.type)
		if index != -1:
			type = index
		else:
			push_error("Unregistered user type: %s | Please add it to the Type Enum"%[user_response.type])
	
	if user_response.has("username"):
		username = user_response.username
	
	if user_response.has("avatar_url"):
		avatar_url = user_response.avatar_url
	
	if user_response.has("signed_up"):
		signed_up = user_response.signed_up
	
	if user_response.has("signed_up_timestamp"):
		signed_up_timestamp = int(user_response.signed_up_timestamp)
	
	if user_response.has("last_logged_in"):
		last_logged_in = user_response.last_logged_in
	
	if user_response.has("last_logged_in_timestamp"):
		last_logged_in_timestamp = int(user_response.last_logged_in_timestamp)
	
	if user_response.has("status"):
		var index = Status.keys().find(user_response.status)
		if index != -1:
			status = index
		else:
			push_error("Unregistered user status: %s | Please add it to the Status Enum"%[user_response.status])
	
	if user_response.has("developer_name"):
		developer_name = user_response.developer_name
	
	if user_response.has("developer_website"):
		developer_website = user_response.developer_website
	
	if user_response.has("developer_description"):
		developer_description = user_response.developer_description


func _to_string() -> String:
	var ident: = "\n   "
	var string: = "UserFetchData:"
	string += "%s%s : %s"%[ident, "success", success]
	string += "%s%s : %s"%[ident, "message", message]
	string += "%s%s : %s"%[ident, "id", id]
	string += "%s%s : %s"%[ident, "type", type]
	string += "%s%s : %s"%[ident, "username", username]
	string += "%s%s : %s"%[ident, "avatar_url", avatar_url]
	string += "%s%s : %s"%[ident, "signed_up", signed_up]
	string += "%s%s : %s"%[ident, "signed_up_timestamp", signed_up_timestamp]
	string += "%s%s : %s"%[ident, "last_logged_in", last_logged_in]
	string += "%s%s : %s"%[ident, "last_logged_in_timestamp", last_logged_in_timestamp]
	string += "%s%s : %s"%[ident, "status", status]
	string += "%s%s : %s"%[ident, "developer_name", developer_name]
	string += "%s%s : %s"%[ident, "developer_website", developer_website]
	string += "%s%s : %s"%[ident, "developer_description", developer_description]
	return string
