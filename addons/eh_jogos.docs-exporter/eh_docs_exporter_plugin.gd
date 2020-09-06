tool
extends EditorPlugin

const DOCS_EXPORTER_TAB = \
		"res://addons/eh_jogos.docs-exporter/editor_uis/DocsExporterProjectSettingsTab.tscn"

var docs_exporter_tab: Control

func _enter_tree():
	docs_exporter_tab = preload(DOCS_EXPORTER_TAB).instance()
	add_control_to_container(
			EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_RIGHT, 
			docs_exporter_tab
	)


func _exit_tree():
	remove_control_from_container(
			EditorPlugin.CONTAINER_PROJECT_SETTING_TAB_RIGHT, 
			docs_exporter_tab
	)
	docs_exporter_tab.queue_free()
