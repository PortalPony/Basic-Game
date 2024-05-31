extends CharacterBody2D

@onready var player = $"../Player"

var movable = false

const SPEED = 120.0

const JUMP_VELOCITY = -400.0


func _physics_process(delta):
	var direction = global_position.direction_to(player.global_position)
	if movable:
		velocity = direction * SPEED
	else:
		velocity = direction * 0 
	if (velocity.x > 0 || velocity.x < 0):
		$Sprite2D.play("Run")
	else:
		$Sprite2D.play("default")
	if velocity.x < 0 :
		$Sprite2D.flip_h = true
	elif velocity.x > 0:
		$Sprite2D.flip_h = false
		
	move_and_slide()
func _on_area_2d_body_entered(body):
	movable = true 

func _on_area_2d_body_exited(body):
	movable = false

	
