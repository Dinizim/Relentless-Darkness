extends CharacterBody2D

@onready var target = $"../Player"

func take_damage(damage):
	Global.ghost_health -= damage

func _physics_process(delta):
	if Global.ghost_health <= 0:
		queue_free()

	if target != null:
		velocity = position.direction_to(target.position) * Global.ghost_speed
		move_and_slide()
