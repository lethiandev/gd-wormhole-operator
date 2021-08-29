extends Node

signal life_changed(lives)
signal level_finished()

var lives_max = 2
var lives = lives_max \
	setget set_lives

func take_life() -> void:
	lives = max(0, lives - 1)
	emit_signal("life_changed", lives)
	$LifeLooseAudio.play()

func set_lives(p_lives: int) -> void:
	lives = p_lives
	emit_signal("life_changed", lives)

func finish_level() -> void:
	emit_signal("level_finished")
