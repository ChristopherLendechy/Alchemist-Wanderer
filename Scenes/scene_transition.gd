extends CanvasLayer

func play_animation():
	$AnimationPlayer.play("transition_level")

func play_animation_reverse():
	$AnimationPlayer.play_backwards("transition_level")
