extends Camera2D
tool

export var view_boundary = Vector2(600, 350) \
	setget set_view_boundary, get_view_boundary

func _process(p_delta: float) -> void:
	if Engine.editor_hint:
		return
	var size = get_viewport_rect().size
	var bounds = view_boundary * 2.0
	var z1 = bounds.x / size.x
	var z2 = bounds.y / size.y
	
	var res = max(z1, z2)
	zoom = Vector2(res, res)

func _draw() -> void:
	if not Engine.editor_hint:
		return
	var vmin = view_boundary * -1.0
	var vmax = view_boundary
	draw_line(Vector2(vmin.x, vmin.y), Vector2(vmax.x, vmin.y), Color.red)
	draw_line(Vector2(vmax.x, vmin.y), Vector2(vmax.x, vmax.y), Color.red)
	draw_line(Vector2(vmax.x, vmax.y), Vector2(vmin.x, vmax.y), Color.red)
	draw_line(Vector2(vmin.x, vmax.y), Vector2(vmin.x, vmin.y), Color.red)

func set_view_boundary(p_bounds: Vector2) -> void:
	view_boundary = p_bounds
	update()

func get_view_boundary() -> Vector2:
	return view_boundary
