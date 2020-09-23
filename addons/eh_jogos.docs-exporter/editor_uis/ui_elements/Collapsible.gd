# Write your doc string for this file here
class_name Collapsible
extends Node

### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------

#--- enums ----------------------------------------------------------------------------------------

#--- constants ------------------------------------------------------------------------------------

#--- public variables - order: export > normal var > onready --------------------------------------

export var text_element_path: = NodePath()
export var collapsible_node_path: = NodePath()

#--- private variables - order: export > normal var > onready -------------------------------------

onready var _text_element: Control = get_node(text_element_path) 
onready var _collapsible: CanvasItem = get_node(collapsible_node_path)

### -----------------------------------------------------------------------------------------------


### Built in Engine Methods -----------------------------------------------------------------------

func _ready():
	if _collapsible == null or _text_element == null:
		queue_free()
		return
	
	_handle_text(_collapsible.visible)
	if not _collapsible.is_connected("ready", self, "_on_collapsible_ready"):
		_collapsible.connect("ready", self, "_on_collapsible_ready")

### -----------------------------------------------------------------------------------------------


### Public Methods --------------------------------------------------------------------------------

func toggle_collapse() -> void:
	_collapsible.visible = not _collapsible.visible
	_handle_text(_collapsible.visible)

### -----------------------------------------------------------------------------------------------


### Private Methods -------------------------------------------------------------------------------

func _handle_text(is_open: bool) -> void:
	if "text" in _text_element:
		var text: String = _text_element.text
		if is_open:
			if text.begins_with("+"):
				text = "-" + text.right(1)
			elif not text.begins_with("-"):
				text = "-" + text
		else:
			if text.begins_with("-"):
				text = "+" + text.right(1)
			elif not text.begins_with("+"):
				text = "+" + text
		
		_text_element.text = text


func _on_collapsible_ready() -> void:
	_handle_text(_collapsible.visible)


### -----------------------------------------------------------------------------------------------
