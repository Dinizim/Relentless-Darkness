extends CharacterBody2D

@onready var _animation_player = $Animation

func take_damage(damage):
	Global.orb_health -= damage

func _physics_process(_delta):
	_animation_player.play("idle")
	
	if Global.orb_health <= 0:
		queue_free()

func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		body.take_damage(Global.orb_damage)
