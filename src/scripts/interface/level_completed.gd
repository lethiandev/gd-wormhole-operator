extends CenterContainer

func _ready() -> void:
	connect("visibility_changed", self, "_on_visibility_changed")

func _on_visibility_changed() -> void:
	if is_visible():
		$CongratulationAudio.play()
