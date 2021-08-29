extends Area2D

func _ready() -> void:
	connect("body_entered", self, "_on_body_entered")

func _on_body_entered(p_body: CollisionObject2D) -> void:
	if not p_body:
		return
	if p_body.is_in_group("ally"):
		$AllyEnterAudio.play()
	if p_body.is_in_group("enemy"):
		GameState.take_life()
	if p_body.has_method("portal_entered"):
		$AnimationPlayer.play("teleport")
		p_body.portal_entered(self)
