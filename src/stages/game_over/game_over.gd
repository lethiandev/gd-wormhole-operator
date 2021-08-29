extends Control

func _input(p_event: InputEvent) -> void:
	if p_event is InputEventMouseButton:
		if p_event.button_index == 1 and p_event.pressed:
			_restart_game()
	if p_event is InputEventScreenTouch:
		if p_event.index == 0 and p_event.pressed:
			_restart_game()

func _restart_game() -> void:
	get_tree().change_scene("res://stages/industral_01/industral_01.tscn")
