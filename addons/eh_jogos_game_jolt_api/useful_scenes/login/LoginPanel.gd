extends PanelContainer
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
signal player_login_confirmed(username, user_token)
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
onready var _username_field = $LoginContent/LoginFields/UsenameLine/LineEdit
onready var _game_token_field = $LoginContent/LoginFields/GameTokenLine/LineEdit

### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------
func _on_CancelButton_pressed() -> void:
	hide()


func _on_ConfirmButton_pressed() -> void:
	var username = _username_field.text
	var user_token = _game_token_field.text
	
	emit_signal("player_login_confirmed", username, user_token)

### ---------------------------------------
