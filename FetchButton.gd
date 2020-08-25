extends Button
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
onready var _fetch_node: eh_GJUsersFetch = get_node("eh_GJUsersFetch")
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass


func _pressed():
#	_fetch_node.request_users(["17741","3753364"])
	_fetch_node.request_user("eh_jogos")

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------
### ---------------------------------------


