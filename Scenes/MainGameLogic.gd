extends Node

var currentCards = []

func _init() -> void:
	pass

func _ready() -> void:
	pass
	
	

func _on_card_creator_cards_created() -> void:
	var cards = get_tree().get_nodes_in_group("cards")
	for card in cards:
		card.connect("flipped",cardCheck)
		card.connect("unflipped",cardRemoved)
	pass # Replace with function body.


func cardCheck(cardRect: Rect2) -> void:
	if currentCards.size() < 1:
		currentCards.append(cardRect)
	else:
		get_tree().call_group("cards", "cardLock",false)
		currentCards.append(cardRect)
		print("CARD RECTs -> ", currentCards)
		#Check if equal
		if currentCards[0] == currentCards[1]:
			print("MATCH")
		else:
			print("NOT A MATCH")
		await get_tree().create_timer(1).timeout
		currentCards.clear()
		get_tree().call_group("cards", "cardLock",true)

func cardRemoved(cardRect: Rect2) -> void:
	currentCards.clear()
