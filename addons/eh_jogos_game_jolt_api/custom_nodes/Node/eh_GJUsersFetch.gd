# Node to manage requests to the `users` endpoint. It wil instantiate and remove
# [eh_GJUsersAuthRequest] nodes as needed.
#
# It can make requests for data on a single user or on multiple users at a time.
# @category: User
class_name eh_GJUsersFetch
extends Node

### Member Variables and Dependencies -----
# signals 

# Signal emitted when a single user request is completed successfully. Sends a [eh_GJUsersFetchData]
# as parameter.
signal gj_fetch_user_completed(eh_gj_users_fetch_data)
# Signal emitted when a multi user request is completed successfully. Sends an array of 
# [eh_GJUsersFetchData] as parameter.
signal gj_fetch_users_completed(array_of_eh_gj_users_fetch_data)
# Signal emitted when a fetch request fails. The dictionary format can vary according to the type of
# error
signal gj_fetch_failed(error_dict)

# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------

func _ready():
	pass

### ---------------------------------------


### Public Methods ------------------------

# Creates a single user request. If you're passing a user_id number instead of username the optional
# parameter must be sent as true.
# Emits [gj_fetch_user_completed] signal if completed successfully or [gj_fetch_failed] if not.
func request_user(p_username: String, is_user_id: bool = false) -> void:
	var request = eh_GJUsersFetchRequest.new()
	add_child(request, true)
	request.connect("gj_user_fetch_data_received", self, "_on_gj_user_fetch_data_received")
	request.connect("gj_request_failed", self, "_on_gj_request_failed")
	
	var error: int = request.fetch_user(p_username)
	if error != OK:
		var error_msg = "Failed with Error Code: %s"%[error]
		error_msg += "\nCheck @GlobalScope in the documentation for a bit more info."
		emit_signal("gj_fetch_user_completed", eh_GJUsersFetchData.new(false, error_msg, {}))


# Creates a multi user request. It only accepts user_ids.
# Emits [gj_fetch_users_completed] signal if completed successfully or [gj_fetch_failed] if not.
func request_users(p_user_ids: Array) -> void:
	var request = eh_GJUsersFetchRequest.new()
	add_child(request, true)
	request.connect("gj_users_fetch_data_received", self, "_on_gj_users_fetch_data_received")
	request.connect("gj_request_failed", self, "_on_gj_request_failed")
	
	var error: int = request.fetch_users(p_user_ids)
	if error != OK:
		var error_msg = "Failed with Error Code: %s"%[error]
		error_msg += "\nCheck @GlobalScope in the documentation for a bit more info."
		emit_signal("gj_fetch_users_completed", [eh_GJUsersFetchData.new(false, error_msg, {})])

### ---------------------------------------


### Private Methods -----------------------
func _on_gj_user_fetch_data_received(eh_gj_users_fetch_data: eh_GJUsersFetchData) -> void:
	emit_signal("gj_fetch_user_completed", eh_gj_users_fetch_data)


func _on_gj_users_fetch_data_received(data_array: Array) -> void:
	emit_signal("gj_fetch_users_completed",data_array)


func _on_gj_request_failed(error_dict: Dictionary) -> void:
	emit_signal("gj_fetch_failed", error_dict)

### ---------------------------------------
