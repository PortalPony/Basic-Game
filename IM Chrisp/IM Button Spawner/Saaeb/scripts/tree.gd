extends Area2D
var able = false
var entered = false
var Item_wood = {"Type": "Material", "Name": "Wood"}

func _process(delta):
	if able ==false:
		if entered == true:
			if Input.is_action_pressed("Shoot"):
				$AnimationPlayer.play("Chop")
				able = true
				$Timer.start()
	


func _on_timer_timeout():
	$AnimationPlayer.play("Vanishing")
	$Timer2.start()

func _on_timer_2_timeout():
	$Wood.visible = true

func _on_body_entered(body):
	entered = true


func _on_body_exited(body):
	entered = false
