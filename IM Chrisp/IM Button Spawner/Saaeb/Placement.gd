extends Node2D

@export var bp: Sprite2D

@export var Tile : TileMap

func CheckCell():
	
	var mouse_tile =  get_global_mouse_position()
	
	var map_pos = Tile.local_to_map(mouse_tile)
	
	var seperate = Tile.map_to_local(map_pos)
	
	var n = Node2D.new()
	
	bp.position = n.to_global(seperate)
	
func _process(delta: float) -> void:
	CheckCell()
