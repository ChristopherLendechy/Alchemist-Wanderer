extends Marker2D

var tweenAppear
func _ready() -> void:
	pass
	
	
func iconAppear(rect: Rect2):
	$MapIcon.set_region_rect(rect)
	tweenAppear = create_tween()
	tweenAppear.tween_property($MapIcon,"self_modulate:a",1,1)
	
