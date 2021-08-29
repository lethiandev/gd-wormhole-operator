extends "res://units/base_unit/unit.gd"

func _physics_process(p_delta: float) -> void:
	var is_walking = not is_equal_approx(linear_velocity.x, 0)
	var is_grounded = is_on_floor()
	
	$AnimationTree["parameters/conditions/is_standing"] = not is_walking
	$AnimationTree["parameters/conditions/is_walking"] = is_walking
	$AnimationTree["parameters/conditions/is_airborne"] = not is_grounded
	$AnimationTree["parameters/conditions/is_grounded"] = is_grounded
	
	$Sprite.flip_h = direction < 0
	
	if is_on_wall() and not $WallImpactAudio.playing:
		$WallImpactAudio.play()

func _on_timeout():
	enable_walking = true

func portal_entered(p_portal: Area2D) -> void:
	$AnimationPlayer2.play("teleport")
	set_physics_process(false)
	collision_layer = 0
	collision_mask = 0

func _on_animation_finished(p_anim: String) -> void:
	if p_anim == "teleport":
		queue_free()
