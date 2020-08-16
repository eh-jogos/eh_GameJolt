tool
extends Control
# Write your doc striing for this file here

### Member Variables and Dependencies -----
# signals 
# enums
# constants
const FILE_PATH = "res://addons/eh_jogos_game_jolt_api/gj_game_credentials.res"

# public variables - order: export > normal var > onready 

# private variables - order: export > normal var > onready 
var _game_credentials : eh_GJGameCredentials = eh_GJGameCredentials.new() as eh_GJGameCredentials

onready var game_id_line_edit: LineEdit = get_node("PropertyList/GameIdLine/GameIdLineEdit")
onready var private_key_line_edit: LineEdit = get_node("PropertyList/PrivateKeyLine/PrivateKeyLineEdit")
### ---------------------------------------


### Built in Engine Methods ---------------
func _ready():
	if ResourceLoader.exists(FILE_PATH):
		_game_credentials = ResourceLoader.load(FILE_PATH)
	else:
		ResourceSaver.save(FILE_PATH, _game_credentials)
	
	_update_fields()

### ---------------------------------------


### Public Methods ------------------------

### ---------------------------------------


### Private Methods -----------------------
func _update_fields() -> void:
	game_id_line_edit.text = _game_credentials.game_id
	private_key_line_edit.text = _game_credentials.private_key


func _save_game_id(value: String) -> void:
	_game_credentials.game_id = value
	ResourceSaver.save(FILE_PATH, _game_credentials)


func _save_private_key(value: String) -> void:
	_game_credentials.private_key = value
	ResourceSaver.save(FILE_PATH, _game_credentials)


func _on_GameIdLineEdit_text_changed(new_text):
	_save_game_id(new_text)

func _on_GameIdLineEdit_text_entered(new_text):
	_save_game_id(new_text)


func _on_PrivateKeyLineEdit_text_changed(new_text):
	_save_private_key(new_text)

func _on_PrivateKeyLineEdit_text_entered(new_text):
	_save_private_key(new_text)


func _on_GameJoltTab_visibility_changed():
	_update_fields()

### ---------------------------------------
