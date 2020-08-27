extends Popup
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
signal player_login_confirmed(username, user_token)

# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
onready var _username_field = $LoginPanel/LoginContent/LoginFields/UsenameLine/LineEdit
onready var _game_token_field = $LoginPanel/LoginContent/LoginFields/GameTokenLine/LineEdit

### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass

### ---------------------------------------


### Public Methods ------------------------
func show_login_popup(username: = "", user_token: = "") -> void:
	_username_field.text = username
	_game_token_field.text = user_token
	popup_centered()

### ---------------------------------------


### Private Methods -----------------------
func _on_CancelButton_pressed() -> void:
	hide()


func _on_SuccessCloseTimer_timeout():
	hide()


func _on_ConfirmButton_pressed() -> void:
	var username = _username_field.text
	var user_token = _game_token_field.text
	
	emit_signal("player_login_confirmed", username, user_token)

### ---------------------------------------

