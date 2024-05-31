extends CharacterBody2D

var paused = false

const SPEED = 300.0

const JUMP_VELOCITY = -400.0

var dir = ""
var Pot = Global.numofpotatos
var Tom = Global.numoftomatos
var all = 0
@onready var animated_sprite_2d = $AnimatedSprite2D
var multipliar = 1
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	all = Tom + Pot / 2
	if Tom + Pot == 10 * multipliar:
		multipliar = 2
		multipliar = multipliar * multipliar
		%"Farming skill".text = ("Farming " + Tom) 
	if Input.is_action_just_pressed("Stats"):
		if paused:
			$CanvasLayer.visible = true
		elif !paused:
			$CanvasLayer.visible = false
			
		paused = !paused
		
	var direction = Input.get_vector("Move_left", "Move_right", "Move_up", "Move_down") 
	
	velocity = direction * SPEED
	
	move_and_slide()
	
	if velocity.x > 0:
		dir = "Right"
		anim(1)
	elif velocity.x < 0:
		dir = "Left"
		anim(1) 
		
	elif velocity.y < 0:
		dir = "Up"
		anim(1)
		
	elif velocity.y > 0:
		anim(1)
		dir = "Down"
		
	else:
		anim(0)
func anim(Number):
	var dire = dir
	if dire == "Up":
		if Number == 1:
			animated_sprite_2d.play("Move_up")
		elif Number == 0:
			animated_sprite_2d.play("Idle_up")
	if dire == "Down":
		if Number == 1:
			animated_sprite_2d.play("Move_down")
		elif Number == 0:
			animated_sprite_2d.play("Idle_down")
	if dire == "Left":
		if Number == 1:
			animated_sprite_2d.play("Move_left")
		elif Number == 0:
			animated_sprite_2d.play("Idle_left")
	if dire == "Right":
		if Number == 1:
			animated_sprite_2d.play("Move_right")
		elif Number == 0:
			animated_sprite_2d.play("Idle_right")

