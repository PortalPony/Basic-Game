extends Area2D
@onready var animation_player = $AnimationPlayer

func _process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("Shoot"):
		animation_player.play("RESET")
		$Timer.start()


func _on_timer_timeout():
	animation_player.play("swing")
