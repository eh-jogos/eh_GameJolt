extends Button
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
onready var _auth_node: eh_GJUsersAuth = get_node("eh_GJUsersAuth")
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass


func _pressed():
	_auth_node.request(_auth_node._username, _auth_node._user_token)

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------
### ---------------------------------------


