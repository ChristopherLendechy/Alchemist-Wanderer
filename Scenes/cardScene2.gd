extends Sprite2D
class_name Card
var frontFacing = false
var flippedOnce = false
var tween
var cardRect
func _init() -> void:
	pass

func _ready() -> void:
	cardRect = $CardBack.get_region_rect()
	print(cardRect)
	$CardBack.set_region_rect(cardRect)
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_mouse"):
		if frontFacing == false:
			if flippedOnce == false or (tween != null and tween.is_running() == false):
				flip_forward()
				flippedOnce = true
			#$%AnimationPlayer.play("CardFlip/FlipForward")
		else:
			if tween != null and tween.is_running() == false:
				flip_back()
			#%AnimationPlayer.play("CardFlip/FlipBack")
		frontFacing = !frontFacing

func flip_forward():
	tween = create_tween()
	tween.tween_property($".","scale",Vector2(0.01,1),0.2)
	tween.tween_property($CardBack,"self_modulate:a",0, 0.1)
	tween.tween_property($CardFront,"self_modulate:a",1, 0.1)
	tween.tween_property($".","scale",Vector2(1,1),0.2)
	
func flip_back():
	tween = create_tween()
	tween.tween_property($".","scale",Vector2(0.01,1),0.2)
	tween.tween_property($CardFront,"self_modulate:a",0, 0.1)
	tween.tween_property($CardBack,"self_modulate:a",1, 0.1)
	tween.tween_property($".","scale",Vector2(1,1),0.2)
	
	

	

	

