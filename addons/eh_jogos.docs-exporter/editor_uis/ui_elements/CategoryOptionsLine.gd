# Write your doc string for this file here
tool
class_name CategoryOptions
extends VBoxContainer

### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------

#--- enums ----------------------------------------------------------------------------------------

#--- constants ------------------------------------------------------------------------------------

#--- public variables - order: export > normal var > onready --------------------------------------

#--- private variables - order: export > normal var > onready -------------------------------------

onready var _data: CategoryOptionalData	
onready var category_name: Button = $CategoryName
onready var weight_spin_box: SpinBox = $OptionsContent/MainColumn/WeightLine/SpinBox
onready var description_text: TextEdit = \
		$OptionsContent/MainColumn/DescriptionContent/ResizableTextEdit

### -----------------------------------------------------------------------------------------------


### Built in Engine Methods -----------------------------------------------------------------------

### -----------------------------------------------------------------------------------------------


### Public Methods --------------------------------------------------------------------------------

func populate_category_entry(p_name: String, p_data: CategoryOptionalData) -> void:
	name = "%sOptions"%[p_name]
	category_name.set_category_name(p_name)
	_data = p_data
	weight_spin_box.value = int(_data.weight)
	description_text.text = _data.description

### -----------------------------------------------------------------------------------------------


### Private Methods -------------------------------------------------------------------------------

func _on_SpinBox_value_changed(value):
	_data.weight = value


func _on_ResizableTextEdit_text_changed():
	_data.description = description_text.text

### -----------------------------------------------------------------------------------------------
