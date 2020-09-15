# Just a simple class to allow toggling password secret on/off
extends LineEdit

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------
func _on_Button_toggled(button_pressed):
	secret = button_pressed
	pass # Replace with function body.

### ---------------------------------------
