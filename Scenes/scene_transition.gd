extends CanvasLayer

func play_animation():
	$PageTurn.play()
	$AnimationPlayer.play("transition_level")
	

func play_animation_reverse():
	$PageTurn.play()
	$AnimationPlayer.play_backwards("transition_level")
