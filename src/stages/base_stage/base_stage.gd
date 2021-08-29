extends Node

export(PackedScene) var next_level
export(int) var lives = 2

func _ready():
	GameInterface.connect("level_completed", self, "_on_level_completed")
	GameState.lives_max = lives
	GameState.lives = lives

func _process(p_delta: float) -> void:
	if _get_level_state():
		set_process(false)
		yield(get_tree().create_timer(1.0), "timeout")
		GameState.finish_level()

func _get_level_state() -> bool:
	var units = get_tree().get_nodes_in_group("unit")
	var canisters = get_tree().get_nodes_in_group("canister")
	
	for canister in canisters:
		if not canister.is_empty():
			return false
	
	return units.empty()

func _on_level_completed() -> void:
	get_tree().change_scene_to(next_level)
