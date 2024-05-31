extends TileMap

func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	if Input.is_action_pressed("Shoot"):
		set_cell(0, tile, 0, Vector2i(6,0), 0)
