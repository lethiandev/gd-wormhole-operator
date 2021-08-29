extends Control

func _enter_tree():
	GameInterface.hide()

func _exit_tree():
	GameInterface.show()

func _on_start_pressed():
	get_tree().change_scene("res://stages/industral_01/industral_01.tscn")
