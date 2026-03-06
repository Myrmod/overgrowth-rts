extends Control

@onready var _screen = find_child("Screen")
@onready var _mouse_movement_restricted = find_child("MouseMovementRestricted")
@onready var _preset_select: OptionButton = find_child("PresetSelect")
@onready var _hotkey_grid: GridContainer = find_child("HotkeyGrid")

var _hotkey_buttons: Array[Button] = []
var _awaiting_slot: String = ""


func _ready():
	_mouse_movement_restricted.button_pressed = (Globals.options.mouse_restricted)
	_screen.selected = Globals.options.screen
	_setup_hotkey_buttons()
	_refresh_hotkey_labels()


func _setup_hotkey_buttons() -> void:
	for i in range(12):
		var slot_name = HotkeySettings.SLOT_NAMES[i]
		var btn: Button = find_child("Slot%dButton" % (i + 1))
		_hotkey_buttons.append(btn)
		btn.pressed.connect(_on_hotkey_slot_pressed.bind(slot_name, btn))


func _refresh_hotkey_labels() -> void:
	var hs = Globals.hotkey_settings
	for i in range(12):
		var slot = HotkeySettings.SLOT_NAMES[i]
		_hotkey_buttons[i].text = hs.get_key_label(slot)


func _on_hotkey_slot_pressed(slot: String, btn: Button) -> void:
	_awaiting_slot = slot
	btn.text = "..."


func _unhandled_key_input(event: InputEvent) -> void:
	if _awaiting_slot == "":
		return
	if not event is InputEventKey:
		return
	if not event.pressed:
		return
	var key_event: InputEventKey = event
	Globals.hotkey_settings.set_binding(_awaiting_slot, key_event.keycode)
	Globals.hotkey_settings.save()
	_awaiting_slot = ""
	_refresh_hotkey_labels()
	_preset_select.selected = 0  # Switch to "Custom"
	get_viewport().set_input_as_handled()


func _on_preset_selected(index: int) -> void:
	if index == 0:
		return  # "Custom" — do nothing
	var preset_names = HotkeySettings.get_presets().keys()
	var preset_name = preset_names[index - 1]
	Globals.hotkey_settings.apply_preset(preset_name)
	Globals.hotkey_settings.save()
	_refresh_hotkey_labels()


func _on_mouse_movement_restricted_pressed():
	Globals.options.mouse_restricted = (_mouse_movement_restricted.button_pressed)
	ResourceSaver.save(Globals.options, Constants.get_options_file_path())


func _on_screen_item_selected(index):
	Globals.options.screen = {
		0: Globals.options.Screen.FULL,
		1: Globals.options.Screen.WINDOW,
	}[index]
	ResourceSaver.save(Globals.options, Constants.get_options_file_path())


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://source/main-menu/Main.tscn")
