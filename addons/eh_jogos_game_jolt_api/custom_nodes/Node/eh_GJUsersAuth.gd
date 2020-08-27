class_name eh_GJUsersAuth
extends Node
# Class to Manage Requests to the `users/auth` endpoint.
# 

### Member Variables and Dependencies -----
# signals 
signal gj_auth_completed(eh_gj_users_auth_data)
signal gj_auth_failed(error_dictionary)

# enums
# constants
const USER_CREDENTIALS_PATH: String = "res://addons/eh_jogos_game_jolt_api/gj_user_credentials.res"

# public variables - order: export > normal var > onready 
var is_logged_in: = false

# private variables - order: export > normal var > onready 
var _username: String = ""
var _user_token: String = ""

### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	_auto_set_user_credentials()

### ---------------------------------------


### Public Methods ------------------------
func get_player_username() -> String:
	return _username


func get_player_user_token() -> String:
	return _user_token


func has_player_credentials() -> bool:
	var has_credentials: = false
	if _username != "" and _user_token != "":
		has_credentials = true
	
	return has_credentials


func self_login(p_username: String = _username, p_user_token: String = _user_token) -> void:
	if _username != p_username:
		_username = p_username
	if _user_token != p_user_token:
		_user_token = p_user_token
	
	if has_player_credentials():
		var request = eh_GJUsersAuthRequest.new()
		add_child(request, true)
		request.connect("gj_auth_data_received", self, "_on_self_login_data_received")
		request.connect("gj_request_failed", self, "_on_self_login_request_failed")
		
		var error: int = request.auth_user_credentials(p_username, p_user_token)
		if error != OK:
			_send_request_error(error)


func request(p_username: String, p_user_token: String) -> void:
	var request = eh_GJUsersAuthRequest.new()
	add_child(request, true)
	request.connect("gj_auth_data_received", self, "_on_gj_auth_data_received")
	request.connect("gj_request_failed", self, "_on_gj_request_failed")
	
	var error: int = request.auth_user_credentials(p_username, p_user_token)
	if error != OK:
		_send_request_error(error)
	
### ---------------------------------------


### Private Methods -----------------------
func _send_request_error(error: int) -> void:
	var error_msg = "Request failed with Error Code: %s"%[error]
	error_msg += "\nCheck @GlobalScope in the documentation for a bit more info."
	emit_signal("gj_auth_failed", {"request_error": error_msg})


func _auto_set_user_credentials() -> void :
	# This only works if the player downloaded the game through gamejolt's client. 
	# Otherwise they'll have to manually login.
	var credentials_path = ".gj-credentials"
	var credentials_file = File.new()
	
	if ResourceLoader.exists(USER_CREDENTIALS_PATH):
		var user_credentials: eh_GJUserCredentials = ResourceLoader.load(USER_CREDENTIALS_PATH)
		_username = user_credentials.username
		_user_token = user_credentials.user_game_token
	elif credentials_file.file_exists(credentials_path):
		_set_user_credentials_based_on_gj_file(credentials_file, credentials_path)


func _set_user_credentials_based_on_gj_file(credentials_file: File, credentials_path: String) -> void:
	var success = credentials_file.open(credentials_path,File.READ)
	if success == OK:
		var content = credentials_file.get_as_text()
		var lines = content.split("\n")
		
		_username = lines[1]
		_user_token = lines[2]
		
		_save_user_credentials()


func _save_user_credentials() -> void:
	var user_credentials: eh_GJUserCredentials = eh_GJUserCredentials.new(_username, _user_token)
	ResourceSaver.save(USER_CREDENTIALS_PATH, user_credentials)


func _on_gj_auth_data_received(auth_data: eh_GJUsersAuthData) -> void:
	emit_signal("gj_auth_completed", auth_data)


func _on_gj_request_failed(error_dict: Dictionary) -> void:
	emit_signal("gj_auth_failed", error_dict)


func _on_self_login_data_received(auth_data: eh_GJUsersAuthData) -> void:
	is_logged_in = true
	_save_user_credentials()
	
	emit_signal("gj_auth_completed", auth_data)


func _on_self_login_request_failed(error_dict: Dictionary) -> void:
	is_logged_in = false
	emit_signal("gj_auth_failed", error_dict)

### ---------------------------------------
