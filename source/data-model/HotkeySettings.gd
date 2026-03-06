class_name HotkeySettings
## Manages hotkey bindings for production grid slots.
## Hotkeys are stored per-slot (F1–F12) and saved to a JSON file.
## Presets provide common layouts (e.g. QWER, grid-based).

const SAVE_PATH = "user://hotkeys.json"
const SLOT_NAMES = [
	"F1",
	"F2",
	"F3",
	"F4",
	"F5",
	"F6",
	"F7",
	"F8",
	"F9",
	"F10",
	"F11",
	"F12",
]

# Maps slot name → physical key (KEY_* constant as int)
var bindings: Dictionary = {}


static func get_default_bindings() -> Dictionary:
	return {
		"F1": KEY_Q,
		"F2": KEY_W,
		"F3": KEY_E,
		"F4": KEY_R,
		"F5": KEY_A,
		"F6": KEY_S,
		"F7": KEY_D,
		"F8": KEY_F,
		"F9": KEY_Z,
		"F10": KEY_X,
		"F11": KEY_C,
		"F12": KEY_V,
	}


static func get_presets() -> Dictionary:
	return {
		"QWER":
		{
			"F1": KEY_Q,
			"F2": KEY_W,
			"F3": KEY_E,
			"F4": KEY_R,
			"F5": KEY_A,
			"F6": KEY_S,
			"F7": KEY_D,
			"F8": KEY_F,
			"F9": KEY_Z,
			"F10": KEY_X,
			"F11": KEY_C,
			"F12": KEY_V,
		},
		"Number Row":
		{
			"F1": KEY_1,
			"F2": KEY_2,
			"F3": KEY_3,
			"F4": KEY_4,
			"F5": KEY_5,
			"F6": KEY_6,
			"F7": KEY_7,
			"F8": KEY_8,
			"F9": KEY_9,
			"F10": KEY_0,
			"F11": KEY_MINUS,
			"F12": KEY_EQUAL,
		},
		"Function Keys":
		{
			"F1": KEY_F1,
			"F2": KEY_F2,
			"F3": KEY_F3,
			"F4": KEY_F4,
			"F5": KEY_F5,
			"F6": KEY_F6,
			"F7": KEY_F7,
			"F8": KEY_F8,
			"F9": KEY_F9,
			"F10": KEY_F10,
			"F11": KEY_F11,
			"F12": KEY_F12,
		},
	}


func _init():
	bindings = get_default_bindings()


func save() -> void:
	var data := {}
	for slot in bindings:
		data[slot] = bindings[slot]
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data, "\t"))
		file.close()


func load_from_file() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		return
	var json = JSON.new()
	var err = json.parse(file.get_as_text())
	file.close()
	if err != OK:
		push_warning("HotkeySettings: failed to parse %s" % SAVE_PATH)
		return
	var data = json.data
	if data is Dictionary:
		for slot in SLOT_NAMES:
			if data.has(slot):
				bindings[slot] = int(data[slot])


func apply_preset(preset_name: String) -> void:
	var presets = get_presets()
	if presets.has(preset_name):
		bindings = presets[preset_name].duplicate()


func get_key_label(slot: String) -> String:
	if not bindings.has(slot):
		return ""
	return OS.get_keycode_string(bindings[slot])


func set_binding(slot: String, keycode: int) -> void:
	bindings[slot] = keycode
