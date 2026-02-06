extends VBoxContainer

const ReplayItemScene = preload("res://source/main-menu/ReplayItem.tscn")

func _ready():
	# Create directory if it doesn't exist
	var dir_path = "user://replays/"
	if not DirAccess.dir_exists_absolute(dir_path):
		var error = DirAccess.make_dir_recursive_absolute(dir_path)
		if error != OK:
			printerr("Failed to create directory: ", dir_path)
			return
			
	var dir = DirAccess.open(dir_path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			# Skip directories and unwanted files
			if not dir.current_is_dir() and not file_name.begins_with(".") and not file_name.ends_with(".import"):
				var full_path = dir_path + file_name
				var item = ReplayItemScene.instantiate()
				self.add_child(item)
				item.setup(full_path)
				item.watch_requested.connect(_on_watch_replay)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print("Error: Could not open directory.")

func _on_watch_replay(path: String):
	print("Load replay:", path)

	ReplayRecorder.load_from_file(path)
	ReplayRecorder.start_replay()

	get_tree().change_scene_to_file("res://match/Match.tscn")
