extends CharacterBody2D

@onready var _animation_player = $Animation
var orb_health = Global.orb_health

func enemy():
	pass

func _physics_process(_delta):
	_animation_player.play("idle")
	
	if orb_health <= 0:
		queue_free()
