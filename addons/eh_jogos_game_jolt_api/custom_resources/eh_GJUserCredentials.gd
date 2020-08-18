extends Resource
class_name eh_GJUserCredentials
# Just a basic struct to hold game credentials information and be able to save it in disk 
# as a Resource

export var username: String 
export var user_game_token: String 

func _init(p_username: = "", p_game_token: = ""):
	username = p_username
	user_game_token = p_game_token
