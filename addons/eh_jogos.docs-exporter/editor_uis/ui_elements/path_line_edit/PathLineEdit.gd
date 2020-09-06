tool
extends LineEdit
# Write your doc striing for this file here

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
func _on_FileDialog_file_selected(path):
	text = path


func _on_FileDialog_dir_selected(dir):
	text = dir

### ---------------------------------------

