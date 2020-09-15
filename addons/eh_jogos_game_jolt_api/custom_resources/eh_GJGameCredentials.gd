# Just a basic struct to hold game credentials information and be able to save it in disk 
# as a Resource.
# @category: Resources/Credentials
tool
class_name eh_GJGameCredentials
extends Resource

# Your game id.
export var game_id: String 
# Your private key. This addon already comes with .gitignore configured so that this file will never
# be pushed to the repository, but be carefull not to share it.
export var private_key: String 
