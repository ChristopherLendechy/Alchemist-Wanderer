extends Sprite2D

@onready var animationCard: AnimationPlayer = $AnimationPlayer
var frontFacing = false
func _init() -> void:
	pass

func _ready() -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_just_pressed("left_mouse"):
		if !frontFacing:
			animationCard.play("FlipForward")
		else:
			animationCard.play("FlipBack")
		frontFacing = !frontFacing
