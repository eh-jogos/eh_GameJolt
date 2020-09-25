# Data Struct that describes the response from `/users/` endpoint
# Further details at [gamejolt\'s api documentation](https://gamejolt.com/game-api/doc/users/fetch)
# @category: User/ResponseData
class_name eh_GJUsersFetchData
extends Resource

# Possible Types defined by GameJolt's documentation.
enum Type {
	User,
	Developer,
	Moderator,
	Administrator
}

# Possible user Status defined by GameJolt's documentation.
enum Status {
	Active,
	Banned
}

# Status of the request.
var success: = false
# Will contain error message if request fails.
var message: = ""
# The ID of the user. 
var id: = 0
# The type of user. Can be any type defined in the enum Types
var type: int = Type.User
# The type of user.
var username: = ""
# The URL of the user's avatar. 
var avatar_url: = ""
# How long ago the user signed up. 
var signed_up: = ""
# The timestamp (in seconds) of when the user signed up. 
var signed_up_timestamp: = 0
# How long ago the user was last logged in. Will be \"Online Now\" if the user is currently online. 
var last_logged_in: = ""
# The timestamp (in seconds) of when the user was last logged in. 
var last_logged_in_timestamp: = 0
# `Status.Active` if the user is still a member of the site. `Status.Banned` if they've been banned. 
var status: int = Status.Active
# The user's display name. 
# (This is available to all users and the `developer_` is there for backwards compatibility)
var developer_name: = ""
# The user's website (or empty string if not specified) 
# (This is available to all users and the `developer_` is there for backwards compatibility)
var developer_website: = ""
# The user's profile markdown description. 
# (This is available to all users and the `developer_` is there for backwards compatibility)
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
