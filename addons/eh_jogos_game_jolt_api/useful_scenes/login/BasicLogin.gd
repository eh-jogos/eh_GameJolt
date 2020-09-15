# Sample Scene for a Basic Login Screen. It will try to auto login and if it succeeds doesn't do 
# anything, if it fails it will show the login popup.
extends Control

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 

# Reference to [eh_GJUsersAuth] Node that will manage any auth logic that's needed.
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

# Opens the Login Popup
func show_login_popup() -> void:
	_popup.show_login_popup(gj_auth.get_player_username(), gj_auth.get_player_user_token())

# Closes the login Popup
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
