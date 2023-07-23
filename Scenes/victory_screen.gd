extends Node

var tween
var tween2
signal gameEnd(level)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reveal_map()# Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func reveal_map():
	tween = create_tween()
	
	tween.tween_property($start,"self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property($"1","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property($"2","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)
	
	tween.tween_property($"4","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"5","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"6","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"7","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"8","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"9","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"10","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"11","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($"12","self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)

	tween.tween_property($treasure,"self_modulate:a",1, .23).set_trans(Tween.TRANS_QUAD)
	
	tween2 = create_tween().set_loops(0)
	tween2.tween_property($treasure,"scale", Vector2(1.5,1.5),.5)
	tween2.tween_property($treasure,"scale", Vector2(1,1),.5)
	
	await get_tree().create_timer(3).timeout
	gameEnd.emit(4)
	
	
	
