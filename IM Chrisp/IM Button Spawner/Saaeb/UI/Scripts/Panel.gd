extends Panel


# change this to whatever Npc should say
var dialog_lines = [
	"Person : Hey what are you doing here .",
	"You : I live here ! .",
	"Person : I didn't know I had neighbors .",
	"You : How did you kill that thing ! . ",
	"Person : Umm it was easy and you really need to know how to survive ."
]

var current_line_index = 0

@onready var label = $Label

@onready var button = $Button

func _ready():
	if button:
		button.connect("pressed", Callable(self, "_on_button_pressed"))
	# Display the first line of dialog
	show_dialog_line()

func show_dialog_line():
	if current_line_index < dialog_lines.size():
		label.text = dialog_lines[current_line_index]
	else:
		# Hide the dialog or reset if all lines are done
		hide_dialog()

func _on_button_pressed():
	# Move to the next line and display it
	current_line_index += 1
	show_dialog_line()

func hide_dialog():
	self.visible = false
func _input(event):
	if event.is_action_pressed("ui_accept"):
		_on_button_pressed()
