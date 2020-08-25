extends Label
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
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
### ---------------------------------------


### Private Methods -----------------------
func _on_eh_GJUsersAuth_gj_auth_completed(eh_gj_users_auth_data: eh_GJUsersAuthData) -> void:
	text = eh_gj_users_auth_data.to_string()


func _on_eh_GJUsersAuth_gj_auth_failed(error_dict: Dictionary) -> void:
	text = str(error_dict)


func _on_eh_GJUsersFetch_gj_fetch_user_completed(eh_gj_users_fetch_data: eh_GJUsersFetchData) -> void:
	text = eh_gj_users_fetch_data.to_string()


func _on_eh_GJUsersFetch_gj_fetch_users_completed(array: Array) -> void:
	for user in array:
		text += user.to_string()


func _on_eh_GJUsersFetch_gj_fetch_failed(error_dict: Dictionary) -> void:
	text = str(error_dict)

### ---------------------------------------
