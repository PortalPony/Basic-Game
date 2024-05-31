extends TileMap


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var tile = local_to_map(get_global_mouse_position())
	if Input.is_action_pressed("place"):
		set_cell(0,tile,0, Vector2i(0,0) , 0)
