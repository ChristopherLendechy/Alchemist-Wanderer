extends Node2D
@export var numberOfMatches : int
var regions = []
var pickedRegions = []
var card = preload("res://Scenes/cardScene2.tscn")
var cards : Array[Card]
var lastRound = false
signal cardsCreated
func _ready() -> void:
	load_regions_from_json()
	
	

func makeCards():
	
	pickRandomCards()
	for i in range(numberOfMatches):
		for j in range(2):
			var currentCard = card.instantiate()
			currentCard.get_node("CardFront").region_rect = pickedRegions[i]
			if pickedRegions[i].size.x !=  pickedRegions[i].size.y:
				if pickedRegions[i].size.x > pickedRegions[i].size.y:
					currentCard.get_node("CardFront").apply_scale(Vector2(0.5,0.5))
				if pickedRegions[i].size.x < pickedRegions[i].size.y:
					currentCard.get_node("CardFront").apply_scale(Vector2(0.5,0.5))
			cards.append(currentCard)
			
	cards.shuffle()
	for card in cards:
		
		add_child(card)		
	place_cards_in_grid()
	cardsCreated.emit()
	pass

func load_regions_from_json() -> Array:
	var file = FileAccess.open("res://info_sheet_01_v2.json", FileAccess.READ)
	var json = JSON.new()
	var info = file.get_as_text() 
	var error = json.parse(info)
	if error == OK:
		var data_received = json.data
		if typeof(data_received) == TYPE_ARRAY:
			for sprite in data_received:
				var rect_data = sprite["rect"]
				if sprite["name"] != "compass.png" and (sprite["name"] != "chest.png" and lastRound == false):
					regions.append(Rect2(rect_data["x"], rect_data["y"], rect_data["width"], rect_data["height"]))
				elif sprite["name"] != "compass.png" and lastRound == true:
					regions.append(Rect2(rect_data["x"], rect_data["y"], rect_data["width"], rect_data["height"]))
			return regions
		else:
			print("Unexpected data")
			return [null]
	else:
		print("JSON Parse Error: ", json.get_error_message(), " in ", info, " at line ", json.get_error_line())
		return [null]
		


func pickRandomCards() :
	var copyArray = regions
	for i in range(numberOfMatches):
		var randomInt = randi_range(0,copyArray.size()-1)
		pickedRegions.append(copyArray[randomInt])
		copyArray.remove_at(randomInt)



func place_cards_in_grid():
	for i in range(cards.size()):
		var row = i / numberOfMatches
		var col = i % numberOfMatches
		
		var x = col * (100 + 15)
		var y = row * (100 + 15)
		
		cards[i].position = Vector2(x, y)
