extends Area2D

export (int) var speed = 1000
export (float) var lifetime = 2.0
var damage = 1
var Velocity = Vector2()

func start(pos, dir, rot):
	position = pos
	rotation = rot
	$Lifetime.wait_time = lifetime
	Velocity = dir * speed

func _physics_process(delta):
	position += Velocity * delta

func explode():
	queue_free()

func _on_Bullet_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
		explode()

func _on_Lifetime_timeout():
	explode()
