extends CanvasLayer

signal level_completed()

func _ready() -> void:
	GameState.connect("life_changed", self, "_on_life_changed")
	GameState.connect("level_finished", self, "_on_level_finished")
	set_process_input(false)

func _input(p_event: InputEvent) -> void:
	if p_event is InputEventMouseButton:
		if p_event.button_index == 1 and p_event.pressed:
			_end_level()
	if p_event is InputEventScreenTouch:
		if p_event.index == 0 and p_event.pressed:
			_end_level()

func _on_life_changed(p_lives: int) -> void:
	$Control/Lives.lives_max = GameState.lives_max
	$Control/Lives.lives = p_lives
	
	if p_lives == 0:
		$GameOver.visible = true
		set_process_input(true)
		get_tree().paused = true

func _on_level_finished() -> void:
	$LevelCompleted.visible = true
	set_process_input(true)
	get_tree().paused = true

func _end_level() -> void:
	if GameState.lives == 0:
		_restart()
	else:
		_complete()

func _restart() -> void:
	get_tree().reload_current_scene()
	set_process_input(false)
	$GameOver.visible = false
	get_tree().paused = false

func _complete() -> void:
	set_process_input(false)
	$LevelCompleted.visible = false
	get_tree().paused = false
	emit_signal("level_completed")

func hide() -> void:
	$Control.hide()

func show() -> void:
	$Control.show()
