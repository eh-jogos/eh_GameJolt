tool
extends VBoxContainer
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
# public variables - order: export > normal var > onready 
# private variables - order: export > normal var > onready 

var _gihub_exporter: MarkdownDocsExporter

var _save_path: StringVariable = null
var _export_path: StringVariable = null

onready var _resource_preloader = $ResourcePreloader
onready var _github_path_selector = $ExportPathRow/DirectorySystemPathLineEdit

### ---------------------------------------


### Built in Engine Methods ---------------

func _ready() -> void:
	_gihub_exporter = MarkdownDocsExporter.new()
	
	_save_path = _resource_preloader.get_resource("save_path")
	_export_path = _resource_preloader.get_resource("github_export_path")
	
	_github_path_selector.set_string_variable(_export_path)

### ---------------------------------------


### Public Methods ------------------------
### ---------------------------------------


### Private Methods -----------------------

func _on_ExportGihubWiki_pressed() -> void:
	_gihub_exporter.export_github_wiki_pages(_save_path.value, _export_path.value)

### ---------------------------------------


### Private Methods -----------------------
### ---------------------------------------


