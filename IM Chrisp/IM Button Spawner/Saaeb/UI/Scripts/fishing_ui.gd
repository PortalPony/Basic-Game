extends Control


var catch_threshold = 0.8
var fish_position = 0.0
var player_progress = 0.0
var catching_speed = 0.01

func _process(delta):
	if is_fishing:
		update_fish_position(delta)
		update_player_progress(delta)
		check_fishing_success()

func update_fish_position(delta):
	fish_position += rand_range(-0.05, 0.05)
	fish_position = clamp(fish_position, 0, 1)
	$FishIndicator.rect_position.x = fish_position * $ProgressBar.rect_size.x

func update_player_progress(delta):
	if Input.is_action_pressed("catch"):
		player_progress += catching_speed * delta
	else:
		player_progress -= catching_speed * delta
	player_progress = clamp(player_progress, 0, 1)
	$ProgressBar.value = player_progress

func check_fishing_success():
	if player_progress >= catch_threshold:
		emit_signal("fish_caught")
		is_fishing = false

