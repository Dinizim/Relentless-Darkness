extends CharacterBody2D

@export var speed = 200

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
	match input_direction:
		Vector2.RIGHT:
			$Animation.play("anim_side")
			$Animation.flip_h = false
			velocity = Vector2(speed, 0)

		Vector2.LEFT:
			$Animation.play("anim_side")
			$Animation.flip_h = true
			velocity = Vector2(-speed, 0)

		Vector2.DOWN:
			$Animation.play("anim_down")
			velocity = Vector2(0, speed)

		Vector2.UP:
			$Animation.play("anim_up")
			velocity = Vector2(0, -speed)

		Vector2.ZERO:
			$Animation.play("anim_idle")
			velocity = Vector2.ZERO
		

func _physics_process(_delta):
	get_input()
	move_and_slide()
