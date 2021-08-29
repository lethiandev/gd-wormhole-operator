extends "res://units/base_unit/base_unit.gd"

func _died() -> void:
	GameState.take_life()
