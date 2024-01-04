extends CharacterBody2D

@onready var target = $"../Player"
func take_damage(damage):
	Global.ghost_health -= damage

func _physics_process(delta):
	
	if Global.ghost_health <= 0:
		queue_free()

	
		
	if target != null:
		velocity = position.direction_to(target.position) * Global.ghost_speed
		
		if (target.position.x - position.x) < 0:
			$Animation.flip_h = true
		else:
			$Animation.flip_h = false
		move_and_slide()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(Global.ghost_damage)
