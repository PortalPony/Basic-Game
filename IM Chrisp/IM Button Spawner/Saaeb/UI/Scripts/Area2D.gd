extends Area2D
@onready var player = $".."

@export var fish_catch_chance := 0.5

signal fish_caught

func _on_fish_bite():
	if randi() % 100 < fish_catch_chance * 100:
		emit_signal("fish_caught")
signal start_fishing


func _on_body_entered(body):
	emit_signal("start_fishing")
