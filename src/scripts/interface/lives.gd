extends HBoxContainer

const LIFE_EMPTY = preload("./life_empty.png")
const LIFE_FULL = preload("./life_full.png")

export(int) var lives_max = 2 \
	setget set_lives_max

export(int) var lives = 2 \
	setget set_lives

func set_lives(p_lives: int) -> void:
	lives = p_lives
	_udate_status()

func set_lives_max(p_lives: int) -> void:
	lives_max = p_lives
	_recreate_hearths()
	_udate_status()

func _recreate_hearths() -> void:
	while lives_max > get_child_count():
		add_child(_create_hearth_node())
	while lives_max < get_child_count():
		get_child(0).free()

func _udate_status() -> void:
	for i in range(get_child_count()):
		var child = get_child(i)
		child.texture = LIFE_FULL if i < lives else LIFE_EMPTY

func _create_hearth_node() -> TextureRect:
	var texnode = TextureRect.new()
	texnode.texture = LIFE_EMPTY
	return texnode
