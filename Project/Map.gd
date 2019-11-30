extends Node2D

var can_shoot = true

func _physics_process(delta):
	if Input.is_action_pressed("ui_left_click"):
		if can_shoot:
			shoot()

func shoot():
	var dir = Vector2(1, 0).rotated($Player/Sprite.rotation)
	var rot = $Player/Sprite.rotation
	var start_pos = $Player.position
	var bullet = preload("res://Bullet.tscn")
	var b = bullet.instance()
	add_child(b)
	b.start(start_pos, dir, rot)
	can_shoot = false
	$Cooldown.start()

func _on_Cooldown_timeout():
	can_shoot = true
