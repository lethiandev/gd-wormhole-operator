extends Node2D

export(Array, PackedScene) var units_queue = []
export(float) var spawn_timer = 5.0
export(float) var spawn_direction = -1

var units = []

func _ready():
	$Timer.wait_time = spawn_timer
	$Timer.start()
	
	for scene in units_queue:
		var unit = scene.instance()
		units.push_back(unit)

func _process(p_delta) -> void:
	if is_empty():
		$Sprite.frame = 0
		return
	
	$Sprite.frame = 1
	if $Timer.time_left < 2.0:
		var sub = $Timer.time_left * 4
		$Sprite.frame = 1 + int(sub) % 2

func _on_timeout():
	if units.empty():
		$Timer.stop()
		return
	
	var next = units.pop_front() as Node2D
	next.position = position
	next.direction = spawn_direction
	get_parent().add_child(next)
	$SpawnAudio.play()

func is_empty() -> bool:
	return units.empty()
