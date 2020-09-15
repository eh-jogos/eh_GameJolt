# Responsible for showing any feedback messages needed. The [eh_GJUsersAuth] signals are connected
# here through the editor, to display the messages it sends.
extends PanelContainer

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 

onready var _label: Label = $Label
onready var _animator: AnimationPlayer = $AnimationPlayer
onready var _success_timer: Timer = $SuccessCloseTimer
### ---------------------------------------


### Built in Engine Methods ---------------

func _ready():
	pass

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------

func _on_eh_GJUsersAuth_gj_auth_completed(data: eh_GJUsersAuthData):
	if data.success:
		_label.text = "Success!"
		_animator.play("open_success")
		_success_timer.start()
	else:
		_label.text = data.message
		_animator.play("open_failed")


func _on_eh_GJUsersAuth_gj_auth_failed(error_dictionary: Dictionary):
	for key in error_dictionary.keys():
		_label.text += "%s: %s"%[key, error_dictionary[key]]
	_animator.play("open_failed")

### ---------------------------------------
