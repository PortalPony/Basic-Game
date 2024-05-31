extends StaticBody2D
@onready var p1lant = $Plant

var plant = Global.plantselected 
var plantgrowing = false
var plantgrown = false
func _physics_process(delta):
	if plantgrowing == false:
		plant = Global.plantselected

func _on_area_2d_area_entered(area):
	if not plantgrowing:
		if plant == 2:
			plantgrowing = true
			$PotatoTimer.start()
			$PotatoFrame1.visible =true
		if plant == 1:
			plantgrowing = true
			$TomatoTimer.start()
			$TomatoFrame1.visible = true
	else:
		print("what in hell are you trying to do !")

func _on_potato_timer_timeout():
	if $PotatoFrame1.is_visible_in_tree():
		$PotatoFrame1.visible = false
		$PotatoFrame2.visible = true
		$PotatoTimer.start()
	if $PotatoFrame2.is_visible_in_tree():
		$PotatoFrame2.visible = false
		$PotatoFrame3.visible = true
		plantgrown = true
func _on_tomato_timer_timeout():
	if $TomatoFrame1.is_visible_in_tree():
		$TomatoFrame1.visible = false
		$TomatoFrame2.visible = true
		$TomatoTimer.start()
	if $TomatoFrame2.is_visible_in_tree():
		$TomatoFrame2.visible = false
		$TomatoFrame3.visible = true
		plantgrown = true
func _on_area_2d_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("Shoot"):
		if plantgrown:
			if plant == 1:
				Global.numoftomatos += 1
				plantgrowing = false
				plantgrown = false
				$TomatoFrame3.visible = false
			if plant == 2:
				Global.numofpotatos +=1
				plantgrowing = false
				plantgrown = false
				$PotatoFrame3.visible = false
			else:
				pass
			print("potatos:"+ str(Global.numofpotatos))
			print("tomatos:"+ str(Global.numoftomatos))
