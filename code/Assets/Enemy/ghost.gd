extends CharacterBody2D


class_name Enemy
var speed: float = 10.0

@onready var target = $"../Player"

func _physics_process(delta):
	if target == null: get_tree().get_nodes_in_group("Player")[0]
	if target != null:
		velocity = position.direction_to(target.position) * speed
		move_and_slide()
