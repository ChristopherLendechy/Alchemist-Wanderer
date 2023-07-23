extends Node

var tween
signal menuClosed
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MusicController.play_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_button_pressed() -> void:
	tween = create_tween()
	tween.tween_property($RichTextLabel,"self_modulate:a",0 , 0.1)
	tween.tween_property($Button,"self_modulate:a",0 , 0.1)
	tween.tween_property($RichTextLabel2,"self_modulate:a",0 , 0.1)
	$TransitionSound.play()
	tween.tween_property($".","size:x",0, 1)
	await get_tree().create_timer(1).timeout
	menuClosed.emit()
