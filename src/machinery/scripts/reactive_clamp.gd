extends "res://machinery/scripts/reactive.gd"

export var value_min = 0.0
export var value_max = 360.0

func set_value(p_value: float) -> void:
	var clamped = clamp(p_value, value_min, value_max)
	.set_value(clamped)

func get_value_factor() -> float:
	return (value - value_min) / value_max
