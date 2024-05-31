extends Area2D

var Speed = 100

var travelled_distance = 0

var range = 500

func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * Speed * delta
	travelled_distance += Speed * delta
	
	if travelled_distance > range:
		queue_free()



func _on_body_entered(body):
	if is_in_group("enemies"):
		queue_free()
