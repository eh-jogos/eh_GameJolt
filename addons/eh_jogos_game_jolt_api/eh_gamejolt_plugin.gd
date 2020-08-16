tool
extends EditorPlugin

const GAMEJOLT_TAB_PATH = "res://addons/eh_jogos_game_jolt_api/editor_uis/gamejolt_project_settings_tab.tscn"

var gamejolt_tab: Control
var plugin


func _enter_tree():
	plugin = preload("res://addons/eh_jogos_game_jolt_api/test_inspector_plugin.gd").new()
	add_inspector_plugin(plugin)
	
	gamejolt_tab = preload(GAMEJOLT_TAB_PATH).instance()
	add_control_to_container(EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_RIGHT, gamejolt_tab)


func _exit_tree():
	remove_inspector_plugin(plugin)
	plugin = null
	
	remove_control_from_container(EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_RIGHT, gamejolt_tab)
	gamejolt_tab.queue_free()
	
