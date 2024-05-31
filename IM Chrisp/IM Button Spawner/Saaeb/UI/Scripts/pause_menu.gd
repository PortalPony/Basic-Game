extends Control
@onready var pause_menu = $"."


func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_resume_pressed():
	var game = preload("res://Scenes/game.tscn").instantiate()
	game.Pause_menu()
	


func _on_quit_pressed():
	get_tree().quit()
