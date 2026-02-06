extends HBoxContainer

class_name ReplayItem

signal watch_requested(file_path)

@onready var label = $Label
@onready var button = $Button

var replay_path: String

func setup(path: String):
	replay_path = path
	label.text = path.get_file()

func _on_button_pressed():
	watch_requested.emit(replay_path)
