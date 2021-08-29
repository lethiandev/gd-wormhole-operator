extends "res://machinery/scripts/reactive_clamp.gd"

export var lift_height = 100
onready var lift_target = $GateBody.position.y

func _ready() -> void:
	connect("value_changed", self, "_on_value_changed")

func _physics_process(p_delta: float) -> void:
	var speed = 30.0 * p_delta
	var prev = $GateBody.position.y
	var next = lerp(prev, -lift_target, speed)
	$GateBody.position.y = next

func _on_value_changed(p_value: float) -> void:
	var factor = get_value_factor()
	lift_target = lift_height * factor
	$CogSprite.rotation_degrees = p_value
