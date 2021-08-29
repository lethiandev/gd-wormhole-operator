extends "res://machinery/scripts/draggable.gd"

signal angle_changed(angle)

export var angle_min = 0.0
export var angle_max = 360.0

var mouse_last = Vector2()
var rotation_last = 0.0

func _ready() -> void:
	rotation = _get_angle_clamped(rotation)
	rotation_last = rotation_degrees
	emit_signal("angle_changed", rotation_degrees)

func _process(p_delta: float) -> void:
	$HintSprite.visible = not is_dragging
	$HintSprite.flip_h = (angle_max - angle_min) / 2 > rotation_degrees
	
	if is_dragging:
		rotation += _get_angle_next()
		rotation = _get_angle_clamped(rotation)
		emit_signal("angle_changed", rotation_degrees)
	
	# Play sound effect
	var rot = rotation_degrees
	var rmin = rotation_last - 30
	var rmax = rotation_last + 30
	
	if rot < rmin or rot > rmax:
		rotation_last = rot
		if not $ClickAudio.playing:
			$ClickAudio.play()

func _drag_begin() -> void:
	mouse_last = _get_mouse_position()

func _drag_end() -> void:
	pass

func _get_angle_next() -> float:
	var pos = _get_mouse_position()
	var angle = mouse_last.angle_to(pos)
	mouse_last = pos
	return angle

func _get_angle_clamped(p_angle: float) -> float:
	var amin = deg2rad(angle_min)
	var amax = deg2rad(angle_max)
	return clamp(p_angle, amin, amax)

func _get_mouse_position() -> Vector2:
	var pos = get_global_mouse_position()
	return pos - global_position
