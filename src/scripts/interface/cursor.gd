extends Control

func _enter_tree() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(p_delta: float) -> void:
	rect_position = get_global_mouse_position()

func _physics_process(p_delta: float) -> void:
	var proxy = get_tree().get_nodes_in_group("input_proxy")
	if proxy.empty():
		return
	
	var pos = proxy[0].get_global_mouse_position()
	var space = get_world_2d().direct_space_state
	var results = space.intersect_point(pos, 32, [], -1, false, true)
	
	var has_interactive = false
	for coll in results:
		var node = coll.collider
		if node.is_in_group("interactive"):
			has_interactive = true
	
	$CursorDefault.visible = not has_interactive
	$CursorPointer.visible = has_interactive
