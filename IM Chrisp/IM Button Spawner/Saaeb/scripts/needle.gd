extends Area2D
@onready var animation_player = $AnimationPlayer

func _process(delta):
	if Input.is_action_just_pressed("needle_control"):
		animation_player.play("test")
		$Timer.start()


func _on_timer_timeout():
	animation_player.play("RESET")
