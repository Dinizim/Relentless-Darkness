extends CharacterBody2D

@onready var target = $"../Player"
@onready var _animation_player = $Body

func _physics_process(delta):	
	_animation_player.play("default")		
	if target != null:
		velocity = position.direction_to(target.position) * Global.orb_speed
		
		if (target.position.x - position.x) < 0:
			$Body.flip_h = true
		else:
			$Body.flip_h = false
		move_and_slide()
	
	if Global.orb_health <= 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(Global.orb_damage)

func take_damage(damage):
	Global.orb_health -= damage
