extends CollisionObject2D

signal drag_began()
signal drag_ended()

var is_dragging = false

func _input_event(p_viewport: Object, p_event: InputEvent, p_idx: int) -> void:
	if is_dragging: return
	var has_mouse = _has_mouse_input(p_event) and p_event.pressed
	var has_touch = _has_touch_input(p_event) and p_event.pressed
	
	if has_mouse or has_touch:
		is_dragging = true
		_drag_begin()
		emit_signal("drag_began")

func _input(p_event: InputEvent) -> void:
	if not is_dragging: return
	var has_mouse = _has_mouse_input(p_event) and not p_event.pressed
	var has_touch = _has_touch_input(p_event) and not p_event.pressed
	
	if has_mouse or has_touch:
		is_dragging = false
		_drag_end()
		emit_signal("drag_ended")

func _has_mouse_input(p_event: InputEvent) -> bool:
	return p_event is InputEventMouseButton and p_event.button_index == 1

func _has_touch_input(p_event: InputEvent) -> bool:
	return p_event is InputEventScreenTouch and p_event.index == 0

func _drag_begin() -> void:
	pass

func _drag_end() -> void:
	pass
