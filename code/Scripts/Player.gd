extends CharacterBody2D

func _ready():
	$Weapon_Area.visible = false
	$Weapon_Area/Weapon_Hitbox.visible = false

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	match input_direction:
		Vector2.RIGHT:
			$Animation.play("run")

		Vector2.LEFT:
			$Animation.play("run")

		Vector2.DOWN:
			$Animation.play("run")

		Vector2.UP:
			$Animation.play("run")

		Vector2.ZERO:
			$Animation.play("idle")

	velocity = input_direction * Global.player_speed

func apply_damage():
	if Input.is_action_just_pressed("ui_attack"):
		$Sword_Animation.play("slash")

func take_damage(damage):
	Global.player_health -= damage
	knockback()

func knockback():
	var knockback_direction = -velocity.normalized() * Global.player_knockback_force
	velocity = knockback_direction
	move_and_slide() 

func _on_weapon_area_body_entered(body):
	if body.is_in_group("Enemies"):
		body.take_damage(Global.sword_damage)

func _physics_process(_delta):
	apply_damage()
	get_input()
	move_and_slide()
