extends GridContainer

class_name Hotkeys


var container = ""

func _ready():
	_assign_grid_shortcuts()
	UserSettings.hotkeys_changed.connect(_assign_grid_shortcuts)

func _assign_grid_shortcuts():	
	var faction = get_meta("faction")
	if faction == null:
		push_warning("unable to load hotkeys, missing faction meta", name)
		return
		
	var action_container = get_meta("actionContainer")
	if action_container == null:
		push_warning("unable to load hotkeys, missing actionContainer meta", name)
		return
		
		
	for button in find_children("*", "Button", true):
		var action = button.get_meta("actionName")
		if action == null:
			push_warning("unable to load hotkey for ", button.name, "in", name, "no actionName metadata")
			continue
		var keycode = UserSettings.get_hotkey(action_container, action)
		if keycode == Key.KEY_NONE:
			push_warning("no hotkey assignment for ", action_container, action)
		var ev := InputEventKey.new()
		var sc := Shortcut.new()
		ev.keycode = keycode
		sc.events = [ev]
		button.shortcut = sc
