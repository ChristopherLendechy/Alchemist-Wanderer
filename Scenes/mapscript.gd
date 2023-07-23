extends Node2D

@onready var Marker = preload("res://Scenes/marker_2d.tscn")
@onready var map = $drawzone

@export var num_markers = 20

var marker_positions = []
var markers = []
@export var min_distance_between_markers  = 60

func _ready():
	# randomize()
	spawn_markers()

func spawn_markers():
	var map_size = map.size
	var map_pos = map.position


# Completely random position placement for markers
# Look up algorithms for properly spaced sprites, and add additional padding on borders 

	for i in range(num_markers):  # Repeat these steps for however many markers you want to spawn
		
		var marker = Marker.instantiate() # Create a new instance of the marker scene
		var random_pos = get_random_position(map_pos, map_size)
		# Assign the marker's position to be a random point within the map
		marker.position = random_pos
		marker_positions.append(random_pos)
		markers.append(marker)
		add_child(marker)  # Add the marker to the scene
		
func get_random_position(map_pos, map_size):
	var random_pos = Vector2(
		randf_range(map_pos.x, map_pos.x + map_size.x),  
		randf_range(map_pos.y, map_pos.y + map_size.y))
	for pos in marker_positions:
		if pos.distance_to(random_pos) < min_distance_between_markers:
			return get_random_position(map_pos, map_size)  # Recursively get a new position if this one is too close to an existing one
	return random_pos




func _matched_card_appear(rect) -> void:
	for i in randi_range(2,10):
		var randomInt = randi_range(0,markers.size()-1)
		markers[randomInt].iconAppear(rect)
		markers.remove_at(randomInt)
	pass # Replace with function body.
