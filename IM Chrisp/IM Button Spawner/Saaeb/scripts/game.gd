extends Node2D
@onready var gui = $GUI
@onready var player = $Player
@export var bp : Sprite2D
@export var Tilemap : TileMap
@onready var sprite_2d = $Sprite2D

var global = Global
var game_paused = false
func _process(delta):
	$Player/Potato.text = str(global.numofpotatos)
	$Player/Tomatos.text = str(global.numoftomatos)
	CheckCell()
func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		game_paused = !game_paused
		if game_paused:
			Engine.time_scale = 0
			gui.visible = true
		else:
			Engine.time_scale = 1
			gui.visible = false
		get_tree().root.get_viewport().set_input_as_handled()


func _on_area_2d_body_entered(body):
	if player:
		$Npc/dialog.visible = true


func _on_area_2d_body_exited(body):
	if player:
		$Npc/dialog.visible = false

func CheckCell():
	var mouse_tile = get_global_mouse_position()
	var map_pos = Tilemap.local_to_map(mouse_tile)
	var co = Tilemap.map_to_local(map_pos)
	var n = Node2D.new()
	bp.global_position = n.to_global(co)
