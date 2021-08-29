extends Node2D

signal value_changed(value)

export var value = 0.0 \
	setget set_value, get_value

func set_value(p_value: float) -> void:
	value = p_value
	emit_signal("value_changed", value)

func get_value() -> float:
	return value
