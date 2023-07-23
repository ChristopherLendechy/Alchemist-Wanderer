extends Sprite2D
class_name Card
var frontFacing = false
var cardChosen = false
var flippedOnce = false
var locked = false
var tween
var cardRect
signal flipped(myRect)
signal unflipped(myRect)
func _init() -> void:
	pass

func _ready() -> void:
	cardRect = $CardFront.get_region_rect()
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_mouse"):
		if locked == false:
			if frontFacing == false:
				if flippedOnce == false or (tween != null and tween.is_running() == false):
					flip_forward()
					flipped.emit(cardRect)
					flippedOnce = true
				#$%AnimationPlayer.play("CardFlip/FlipForward")
			else:
				if tween != null and tween.is_running() == false:
					flip_back()
					unflipped.emit(cardRect)
				#%AnimationPlayer.play("CardFlip/FlipBack")
			

func flip_forward():
	frontFacing = !frontFacing
	cardChosen = true
	add_to_group("chosenCard")
	tween = create_tween()
	tween.tween_property($".","scale",Vector2(0.01,1),0.2)
	tween.tween_property($CardBack,"self_modulate:a",0, 0.1)
	tween.tween_property($CardFront,"self_modulate:a",1, 0.1)
	tween.tween_property($".","scale",Vector2(1,1),0.2)
	
func flip_back():
	cardChosen = false
	frontFacing = !frontFacing
	remove_from_group("chosenCard")
	tween = create_tween()
	tween.tween_property($".","scale",Vector2(0.01,1),0.2)
	tween.tween_property($CardFront,"self_modulate:a",0, 0.1)
	tween.tween_property($CardBack,"self_modulate:a",1, 0.1)
	tween.tween_property($".","scale",Vector2(1,1),0.2)
	
	

func cardLock(matchChecked: bool):
	locked = !locked
	if cardChosen == true and matchChecked == true:
		flip_back()
	

func matched():
	queue_free()
