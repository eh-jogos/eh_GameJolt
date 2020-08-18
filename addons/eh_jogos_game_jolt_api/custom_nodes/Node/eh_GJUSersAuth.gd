class_name eh_GJUsersAuth
extends Node
# Class to Manage Requests to the `users/auth` endpoint.
# 

### Member Variables and Dependencies -----
# signals 
signal gj_auth_completed(eh_gj_users_auth_data)

# enums
# constants
const USER_CREDENTIALS_PATH: String = "res://addons/eh_jogos_game_jolt_api/gj_user_credentials.res"

# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
var _username: String = ""
var _user_token: String = ""

### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	_auto_set_user_credentials()
	
	if _username != "" and _user_token != "":
		make_request(_username, _user_token)
	else:
		pass
	pass

### ---------------------------------------


### Public Methods ------------------------
func make_request(p_username: String, p_user_token: String) -> void:
	var request = eh_GJUsersAuthRequest.new()
	add_child(request, true)
	
	request.auth_user_credentials(p_username, p_user_token)
	var auth_data: eh_GJUsersAuthData = yield(request, "gj_auth_data_received")
	emit_signal("gj_auth_completed", auth_data)
	
### ---------------------------------------


### Private Methods -----------------------
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
		
		var user_credentials: eh_GJUserCredentials = eh_GJUserCredentials.new(_username, _user_token)
		ResourceSaver.save(USER_CREDENTIALS_PATH, user_credentials)

### ---------------------------------------
