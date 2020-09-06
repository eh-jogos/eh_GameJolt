tool
class_name StringVariableArray
extends Resource
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
export(Array, Resource) var value: = []
 
# private variables - order: export > normal var > onready 
### ---------------------------------------


### Built in Engine Methods ---------------

### ---------------------------------------

func push(element: StringVariable) -> void:
	if element == null:
		push_error("StringVariableArray only accepts StringVariables as elements")
		return
	
	value.push_front(element)


func get_string_array() -> Array:
	var array: = []
	for string_variable in value:
		array.push_back(string_variable.value)
	return array

### Public Methods ------------------------


### ---------------------------------------


### Private Methods -----------------------
### ---------------------------------------


