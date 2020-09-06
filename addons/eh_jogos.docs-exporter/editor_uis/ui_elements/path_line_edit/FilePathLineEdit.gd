tool
extends HBoxContainer
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 

# private variables - order: export > normal var > onready 
var _path_variable: StringVariable = null

onready var _line_edit: LineEdit = $PathLineEdit
### ---------------------------------------


### Built in Engine Methods ---------------

### ---------------------------------------


### Public Methods ------------------------
func set_string_variable	(resource: StringVariable) -> void:
	_path_variable = resource
	_line_edit.text = _path_variable.value

### ---------------------------------------


### Private Methods -----------------------

func _update_path_variable(path: String) ->void:
	_path_variable.value = path


func _on_LineEdit_text_changed(new_text: String):
	_update_path_variable(new_text)


func _on_LineEdit_text_entered(new_text: String):
	_update_path_variable(new_text)


func _on_FileDialog_dir_selected(dir: String):
	_update_path_variable(dir)


func _on_FileDialog_file_selected(path: String):
	_update_path_variable(path)

### ---------------------------------------







