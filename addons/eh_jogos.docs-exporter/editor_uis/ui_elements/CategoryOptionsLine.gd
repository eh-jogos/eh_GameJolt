# Write your doc string for this file here
class_name CategoryOptions
extends VBoxContainer

### Member Variables and Dependencies -------------------------------------------------------------
#--- signals --------------------------------------------------------------------------------------

#--- enums ----------------------------------------------------------------------------------------

#--- constants ------------------------------------------------------------------------------------

#--- public variables - order: export > normal var > onready --------------------------------------

#--- private variables - order: export > normal var > onready -------------------------------------

var _entry_dict: Dictionary

onready var category_name: Button = $CategoryName
onready var weight_spin_box: SpinBox = $OptionsContent/MainColumn/WeightLine/SpinBox
onready var description_text: TextEdit = \
		$OptionsContent/MainColumn/DescriptionContent/ResizableTextEdit

### -----------------------------------------------------------------------------------------------


### Built in Engine Methods -----------------------------------------------------------------------

### -----------------------------------------------------------------------------------------------


### Public Methods --------------------------------------------------------------------------------

func populate_category_entry(p_name: String, p_dict: Dictionary) -> void:
	name = "%sOptions"%[p_name]
	category_name.set_category_name(p_name)
	_entry_dict = p_dict
	weight_spin_box.value = int(_entry_dict.weight)
	description_text.text = _entry_dict.description

### -----------------------------------------------------------------------------------------------


### Private Methods -------------------------------------------------------------------------------

### -----------------------------------------------------------------------------------------------
