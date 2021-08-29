extends KinematicBody2D

export(Texture) var badge = null
export(float) var speed = 100.0

var linear_velocity = Vector2()
var enable_walking = false
var direction = 0

func _process(p_delta: float) -> void:
	if global_position.y > 1000:
		queue_free()
		_died()

func _physics_process(p_delta: float) -> void:
	var motion = 0.0
	
	if is_on_floor() and enable_walking:
		motion = direction
	_update_velocity(motion)
	
	var gravity = Vector2(0, 500)
	linear_velocity += gravity * p_delta
	
	var lv = linear_velocity
	var snap = Vector2(0, 32)
	lv = move_and_slide_with_snap(lv, snap, Vector2.UP, true, 4, 1.0)
	linear_velocity = lv
	
	if is_on_wall():
		direction *= -1
		_update_velocity(direction)

func _update_velocity(p_dir: float) -> void:
	var final_speed = p_dir * speed
	linear_velocity.x = final_speed

func _died() -> void:
	pass
