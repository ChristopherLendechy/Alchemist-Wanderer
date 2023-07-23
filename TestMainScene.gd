extends Node2D
var game_level = preload("res://Scenes/game_level.tscn")
func _ready() -> void:
	# Launch Level One
	var levelOne = game_level.instantiate()
	levelOne.connect("levelPassed", nextLevel)
	levelOne.totalMatches = 2
	levelOne.currentLevel = 1
	add_child(levelOne)
	
	
	
func nextLevel(finishedLevel):
	var level = get_tree().get_nodes_in_group("game_level")
	var lastLevel = level[0]
	remove_child(lastLevel)
	await get_tree().create_timer(1.5).timeout
	# ADD IN BETWEEN HERE
	match finishedLevel + 1:
		2:
			var levelTwo = game_level.instantiate()
			levelTwo.connect("levelPassed", nextLevel)
			levelTwo.totalMatches = 3
			levelTwo.currentLevel = 2
			add_child(levelTwo)
			
		3:
			var levelThree = game_level.instantiate()
			levelThree.connect("levelPassed", nextLevel)
			levelThree.totalMatches = 8
			levelThree.currentLevel = 2
			add_child(levelThree)
	
