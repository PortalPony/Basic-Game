extends Node2D



#WARNING BUtton system Code
var texture = preload("res://IM Chrisp/IM Button Spawner/Button Border.png")
var columns = 2
var rows = 2
var previousButtonPosition = Vector2(100, 100)
func _on_Button_pressed0():
	pass
func _on_Button_pressed1():
	pass
func _on_Button_pressed2():
	pass
func _on_Button_pressed3():
	pass



func _ready():
	for i in range(columns):
		for j in range(rows):
			var script = GDScript.new()
			var button = TextureButton.new()
			var label = Label.new()
			button.texture_normal = texture
			button.stretch_mode = TextureButton.STRETCH_SCALE
			button.set_size(Vector2(90,30))
			label.text = "Button " + str(i * 2 + j + 1)
			label.set_position(previousButtonPosition + Vector2(j * 120, i * 40))
			button.set_position(previousButtonPosition + Vector2(j * 120, i * 40))
			button.connect("pressed", Callable(self, "_on_Button_pressed" + str(i * 2 + j)))
			add_child(button)
			add_child(label)
			#call(call)
			#print_debug(AutoLoad.testVar)



func _on_texture_button_pressed():
	print_debug("WHY")
