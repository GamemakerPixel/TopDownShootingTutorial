extends KinematicBody2D

export (int) var speed = 500

var Velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		Velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		Velocity.x = -speed
	else:
		Velocity.x = 0
	if Input.is_action_pressed("ui_down"):
		Velocity.y = speed
	elif Input.is_action_pressed("ui_up"):
		Velocity.y = -speed
	else:
		Velocity.y = 0
	move_and_slide(Velocity)
	$Sprite.look_at(get_global_mouse_position())