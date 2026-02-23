extends GridContainer

class_name Hotkeys


@export var faction: String = "general"

func _ready():
	_assign_grid_shortcuts()
	UserSettings.hotkeys_changed.connect(_assign_grid_shortcuts)

func _assign_grid_shortcuts():	
	print("assigning shortcuts for ", name, " from faction ", faction)
	
	for button: Button in find_children("*", "Button", true):
		# See if the button is connected to anything. If not then its not hotkeyable
		if _has_connection(button):
			var keycode = UserSettings.get_hotkey(faction, name, button.name)
			if keycode == Key.KEY_NONE:
				push_warning("not hotkey assignment for ", faction, name, button.name)
			else:
				print("assigning keycode: ", keycode, " to ", faction, name, button.name)
			var ev := InputEventKey.new()
			var sc := Shortcut.new()
			ev.keycode = keycode
			sc.events = [ev]
			button.shortcut = sc

func _has_connection(button: Button) -> bool:
	return button.pressed.get_connections().size() > 0 \
		or button.toggled.get_connections().size() > 0
