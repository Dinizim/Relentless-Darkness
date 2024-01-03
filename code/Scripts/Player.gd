extends CharacterBody2D

func _ready():
	$Weapon_Area.visible = false
	$Weapon_Area/Weapon_Hitbox.visible = false

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	match input_direction:
		Vector2.RIGHT:
			$Animation.play("anim_side")
			$Animation.flip_h = false

		Vector2.LEFT:
			$Animation.play("anim_side")
			$Animation.flip_h = true

		Vector2.DOWN:
			$Animation.play("anim_down")

		Vector2.UP:
			$Animation.play("anim_up")

		Vector2.ZERO:
			$Animation.play("anim_idle")

	velocity = input_direction * Global.player_speed

func apply_damage():
	if Input.is_action_just_pressed("ui_attack"):
		$Sword_Animation.play("slash")

func take_damage(damage):
	Global.player_health -= damage

func _on_weapon_area_body_entered(body):
	if body.is_in_group("Enemies"):
		body.take_damage(Global.sword_damage)

func _physics_process(_delta):
	apply_damage()
	get_input()
	move_and_slide()
