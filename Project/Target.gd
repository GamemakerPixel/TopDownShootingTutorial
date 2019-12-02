extends StaticBody2D

var hits = 0

func _process(delta):
	$Label.text = str(hits)

func take_damage(damage):
	hits += damage