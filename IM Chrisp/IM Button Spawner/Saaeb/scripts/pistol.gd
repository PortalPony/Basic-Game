extends Area2D
@onready var shootingpoinst = %shootingpoinst

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("Shoot"):
		shoot()
func shoot():
	const BULLET = preload("res://Scenes/bullet.tscn")
	var bullet = BULLET.instantiate()
	bullet.global_position = shootingpoinst.global_position
	bullet.global_rotation = shootingpoinst.global_rotation
	get_parent().add_sibling(bullet)
