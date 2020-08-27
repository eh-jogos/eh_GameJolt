extends Control
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
onready var gj_auth: eh_GJUsersAuth = $eh_GJUsersAuth

# private variables - order: export > normal var > onready 
onready var _popup: Popup = $LoginPopup

### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	if gj_auth.has_player_credentials():
		gj_auth.self_login()
	else:
		show_login_popup()

### ---------------------------------------


### Public Methods ------------------------
func show_login_popup() -> void:
	_popup.show_login_popup(gj_auth.get_player_username(), gj_auth.get_player_user_token())


func close_login_popup() -> void:
	_popup.hide()

### ---------------------------------------


### Private Methods -----------------------
func _on_eh_GJUsersAuth_gj_auth_completed(eh_gj_users_auth_data: eh_GJUsersAuthData) -> void:
	if not eh_gj_users_auth_data.success:
		show_login_popup()


func _on_LoginPopup_player_login_confirmed(username: String, user_token: String):
	gj_auth.self_login(username, user_token)

### ---------------------------------------
