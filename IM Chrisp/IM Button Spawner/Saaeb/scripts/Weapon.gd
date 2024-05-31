extends Area2D



func _process(delta):
	var ENEMY = preload("res://Scenes/Enemy.tscn").instantiate()
	$Marker2D.look_at(ENEMY.global_position)
	if Input.is_action_pressed("Shoot"):
		shoot()
func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var bullet = BULLET.instantiate()
	bullet.global_position = %Marker2D.global_position
	bullet.global_rotation = %Marker2D.global_rotation
	get_parent().get_parent().get_parent().add_child(bullet)
