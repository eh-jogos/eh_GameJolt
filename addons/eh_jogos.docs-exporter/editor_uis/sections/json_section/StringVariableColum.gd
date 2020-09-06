tool
extends VBoxContainer
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready
var _editor_field_packed_scene: PackedScene = null

onready var _resource_preloader: ResourcePreloader = $ResourcePreloader
### ---------------------------------------


### Built in Engine Methods ---------------

func _ready():
	_editor_field_packed_scene = _resource_preloader.get_resource("editor_field")

### ---------------------------------------


### Public Methods ------------------------

func populate_editor_fields(fields: StringVariableArray) -> void:
	print("POPULATING")
	for field in fields.value:
		print("field: %s | field_value: %s"%[field, field.value])
		var string_variable = field as StringVariable
		var editor_field = _editor_field_packed_scene.instance()
		add_child(editor_field, true)
		move_child(editor_field, 1)
		
		if editor_field.has_method("set_string_variable"):
			editor_field.set_string_variable(string_variable)

### ---------------------------------------


### Private Methods -----------------------
### ---------------------------------------


