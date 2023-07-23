extends Node

var main_menu = preload("res://Scenes/main_menu.tscn")
# var test_main_scene = preload("res://Scenes/test_main.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func restart_game():
	#var menu = main_menu.instantiate()
	#add_child(main_menu)
	
	get_tree().reload_current_scene()



func _on_main_menu_menu_closed() -> void:
	remove_child(get_node("MainMenu"))
	
