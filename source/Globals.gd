extends Node

const Options = preload("res://source/data-model/Options.gd")

var options = (
	load(Constants.get_options_file_path())
	if ResourceLoader.exists(Constants.get_options_file_path())
	else Options.new()
)
var god_mode = false
var cache = {}


func _unhandled_input(event):
	if event.is_action_pressed("toggle_god_mode"):
		_toggle_god_mode()


func _toggle_god_mode():
	if not FeatureFlags.god_mode:
		return
	god_mode = not god_mode
	if god_mode:
		Signals.god_mode_enabled.emit()
	else:
		Signals.god_mode_disabled.emit()
