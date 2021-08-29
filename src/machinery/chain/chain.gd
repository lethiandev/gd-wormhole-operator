extends "res://machinery/scripts/reactive.gd"

func _ready() -> void:
	connect("value_changed", self, "_on_value_changed")
	material = material.duplicate()

func _on_value_changed(p_value: float) -> void:
	if material is ShaderMaterial:
		material.set_shader_param("offset", p_value)
