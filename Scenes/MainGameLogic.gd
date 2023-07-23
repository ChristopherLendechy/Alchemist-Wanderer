extends Node

var currentCards = []
signal matchedCard(rect)
var totalMatches
var currentMatches = 0
var currentLevel


signal levelPassed(level)

func _init() -> void:
	pass

func _ready() -> void:
	create_level()
	pass
	
func create_level():
	$Cards/CardCreator.numberOfMatches = totalMatches
	if currentLevel == 3:
		$Cards/CardCreator.lastRound = true
	$Cards/CardCreator.makeCards()
	pass
	
func _on_card_creator_cards_created() -> void:
	var cards = get_tree().get_nodes_in_group("cards")
	for card in cards:
		card.connect("flipped",cardCheck)
		card.connect("unflipped",cardRemoved)
		
func cardCheck(cardRect: Rect2) -> void:
	if currentCards.size() < 1:
		currentCards.append(cardRect)
	else:
		get_tree().call_group("cards", "cardLock",false)
		currentCards.append(cardRect)
		#Check if equal
		if currentCards[0] == currentCards[1]:
			await get_tree().create_timer(1).timeout
			get_tree().call_group("chosenCard","matched")
			matchedCard.emit(cardRect)
			currentMatches = currentMatches + 1
			
			currentCards.clear()
			get_tree().call_group("cards", "cardLock",true)
			if currentMatches == totalMatches:
				print("LEVEL CLEARED")
				await get_tree().create_timer(1).timeout
				SceneTransition.play_animation_reverse()
				await get_tree().create_timer(1).timeout
				levelPassed.emit(currentLevel)
				
				queue_free()
		else:
			await get_tree().create_timer(1).timeout
			currentCards.clear()
			get_tree().call_group("cards", "cardLock",true)
		
		

func cardRemoved(cardRect: Rect2) -> void:
	currentCards.clear()

