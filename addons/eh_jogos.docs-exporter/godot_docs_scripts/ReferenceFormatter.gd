tool
class_name ReferenceFormatter
extends JsonIO
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 

# A list of directories to collect files from.
var directories := ["res://addons/eh_jogos_game_jolt_api"]
# If true, explore each directory recursively
var is_recursive: = true
# A list of patterns to filter files.
var patterns := ["*.gd"]
# Output path to save the class reference.
var save_path := "res://formated_reference.json"

# private variables - order: export > normal var > onready 
var custom_class_db : = {}
var custom_inheritance_db : = {}

### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	pass

func _run() -> void:
	export_formatted_reference_json(directories, patterns, is_recursive, save_path)

### ---------------------------------------


### Public Methods ------------------------

func export_formatted_reference_json(
		directories: Array, 
		patterns: Array, 
		is_recursive: bool, 
		save_path: String
) -> void:
	_build_custom_class_dbs()
	
	var reference_dict : = _build_reference_dictionary_from_source_code(
			directories, 
			patterns, 
			is_recursive
	)
	
	var formatted_reference : Dictionary = {
			name = reference_dict.name,
			description = reference_dict.description,
			version = reference_dict.version,
			classes = []
	}
	
	for class_entry in reference_dict.classes:
		if class_entry.name == "":
			continue
		
		var parent_class : String = class_entry.extends_class[0]
		var full_inheritance : Array = _get_inheritance(parent_class)
		class_entry.extends_class = full_inheritance
		
		if custom_inheritance_db.has(class_entry.name):
			class_entry["inherited_by"] = custom_inheritance_db[class_entry.name]
		
		formatted_reference.classes.append(class_entry)
	
	_write_dictionary_to_file(formatted_reference, save_path)

### ---------------------------------------


### Private Methods -----------------------

func _build_reference_dictionary_from_source_code(
		directories: Array, 
		patterns: Array, 
		is_recursive: bool
) -> Dictionary:
	var Collector: SceneTree = \
			load("res://addons/eh_jogos.docs-exporter/godot_docs_scripts/Collector.gd").new()
	
	var files := PoolStringArray()
	for dirpath in directories:
		files.append_array(Collector.find_files(dirpath, patterns, is_recursive))
	var reference_dict : Dictionary = Collector.get_reference(files, true)
	Collector = null
	
	return reference_dict


func _get_inheritance(p_class: String) -> Array:
	var inheritance_array = [p_class]
	
	var parent_class = ""
	if ClassDB.class_exists(p_class):
		parent_class = ClassDB.get_parent_class(p_class)
	elif custom_class_db.has(p_class):
		parent_class = custom_class_db[p_class]
	
	if parent_class != "":
		var class_array: = _get_inheritance(parent_class)
		inheritance_array += class_array
	
	return inheritance_array


func _build_custom_class_dbs() -> void:
	var custom_classes_array : = []
	var config = ConfigFile.new()
	var err = config.load("res://project.godot")
	if err != OK:
		return
	
	custom_classes_array = config.get_value("", "_global_script_classes")
	for custom_class in custom_classes_array:
		custom_class_db[custom_class.class] = custom_class.base
		if not ClassDB.class_exists(custom_class.base):
			if not custom_inheritance_db.has(custom_class.base):
				custom_inheritance_db[custom_class.base] = []
			custom_inheritance_db[custom_class.base].append(custom_class.class)

### ---------------------------------------


