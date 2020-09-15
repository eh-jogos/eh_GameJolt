# Just a basic struct to hold user credentials information and be able to save it in disk 
# as a Resource
# @category: Resources/Credentials
class_name eh_GJUserCredentials
extends Resource

# User's username
export var username: String 
# User's game token. This addon already comes with .gitignore configured so that the credentials for
# the player that owns the game won't be pushed to the repository, but be carefull not to share it.
# This isn't a problem for the released game, but might expose your game token if you're testing
# your game in production and you share this file, or push files like this to your repository.
export var user_game_token: String 

func _init(p_username: = "", p_game_token: = ""):
	username = p_username
	user_game_token = p_game_token
