tool
extends VBoxContainer
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 

var _hugo_exporter: HugoMarkdownDocsExporter

var _save_path: StringVariable = null
var _export_path: StringVariable = null

onready var _resource_preloader = $ResourcePreloader
onready var _hugo_path_selector = $ExportPathRow/DirectorySystemPathLineEdit

### ---------------------------------------


### Built in Engine Methods ---------------

func _ready() -> void:
	_hugo_exporter = HugoMarkdownDocsExporter.new()
	
	_save_path = _resource_preloader.get_resource("save_path")
	_export_path = _resource_preloader.get_resource("hugo_export_path")
	
	_hugo_path_selector.set_string_variable(_export_path)

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------

func _on_ExportHugoContent_pressed() -> void:
	_hugo_exporter.export_hugo_site_pages(_save_path.value, _export_path.value)

### ---------------------------------------


### Private Methods -----------------------
### ---------------------------------------


