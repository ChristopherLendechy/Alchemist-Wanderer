extends Node

#var main_menu = preload("res://Scenes/main_menu.tscn")
var game_scene = preload("res://Scenes/test_main_scene.tscn")
var main_menu
# var test_main_scene = preload("res://Scenes/test_main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu = $MainMenu

func _on_main_menu_menu_closed() -> void:
	remove_child(main_menu)
	

func _on_test_main_scene_game_restart() -> void:
	get_tree().reload_current_scene()
	
