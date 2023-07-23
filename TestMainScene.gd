extends Node2D
var game_level = preload("res://Scenes/game_level.tscn")
var final_level = preload("res://Scenes/victory_screen.tscn")
var main_menu = preload("res://Scenes/main_menu.tscn")
signal gameRestart
func _ready() -> void:
	# Launch Level One
	level_1()
	
	
	
func nextLevel(finishedLevel):
	var level = get_tree().get_nodes_in_group("game_level")
	var lastLevel = level[0]

	remove_child(lastLevel)
	await get_tree().create_timer(1.5).timeout
	
	SceneTransition.play_animation()
	# ADD IN BETWEEN HERE
	
	
	match finishedLevel + 1:
		2:
			var levelTwo = game_level.instantiate()
			levelTwo.connect("levelPassed", nextLevel)
			levelTwo.totalMatches = 5
			levelTwo.currentLevel = 2
			add_child(levelTwo)
			
		3:
			var levelThree = game_level.instantiate()
			levelThree.connect("levelPassed", nextLevel)
			levelThree.totalMatches = 7
			levelThree.currentLevel = 3
			add_child(levelThree)
			
		4:
			var levelFinal = final_level.instantiate()
			levelFinal.connect("gameEnd", nextLevel)
			levelFinal.add_to_group("game_level")
			add_child(levelFinal)
			
		5:
			gameRestart.emit()
			get_tree().reload_current_scene()
			#await get_tree().create_timer(1).timeout
			queue_free()
			#var menu = main_menu.instantiate()
			#add_sibling(main_menu)
			#level_1()
			#get_parent().get_node("Main Scene").restart_game()
		
func level_1():
	var levelOne = game_level.instantiate()
	levelOne.connect("levelPassed", nextLevel)
	levelOne.totalMatches = 4
	levelOne.currentLevel = 1
	add_child(levelOne)
