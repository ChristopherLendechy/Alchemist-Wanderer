# actions.gd
extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.




func _input(event):
	#DEBUG
	# only run in editor, not in exported build
	if OS.has_feature("editor"):

		if event.is_action_pressed("dbg_reload_game"):
			get_tree().reload_current_scene()

		if event.is_action_pressed("dbg_end_game"):
			get_tree().quit()
	else:
		pass
