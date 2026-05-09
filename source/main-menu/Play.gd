extends Control

# Mode A — normal:
# Main → Play → Loading → Match

# Mode B — replay:
# ReplayMenu → Play (replay mode) → Loading → Match

const PlayerSettingsScene = preload("res://source/main-menu/PlayerSettings.tscn")
const LoadingScene = preload("res://source/main-menu/Loading.tscn")

var replay_resource = null

var _map_paths = []
var _map_info = {}  # path -> {name, players, size} — unified registry for built-in + custom maps
var _num_spawns := 0

@onready var _start_button = find_child("StartButton")
@onready var _map_list = find_child("MapList")
@onready var _map_details = find_child("MapDetailsLabel")
@onready var _map_preview = find_child("MapPreview")


func _ready():
	if replay_resource != null:
		_start_from_replay()
		return

	_setup_map_list()
	_on_map_list_item_selected(0)


func _setup_map_list():
	# Start with built-in maps
	_map_info = MatchConstants.MAPS.duplicate(true)

	# Scan for user maps under res://maps/ (recursive).  Both editor-created
	# .tres MapResources and scene-based .tscn maps (e.g. custom-mode maps
	# like Direct Strike) are picked up.  Subfolders become categories.
	_scan_custom_maps("res://maps/", "")

	# Sort by player count, then by name
	var entries: Array = Utils.Dict.items(_map_info)
	entries.sort_custom(
		func(a, b):
			if a[1]["players"] != b[1]["players"]:
				return a[1]["players"] < b[1]["players"]
			return a[1]["name"] < b[1]["name"]
	)

	_map_paths = entries.map(func(e): return e[0])
	_map_list.clear()
	for path in _map_paths:
		_map_list.add_item(_map_info[path]["name"])
	if not _map_paths.is_empty():
		_map_list.select(0)


func _scan_custom_maps(dir_path: String, category: String) -> void:
	"""Recursively scan `dir_path` for .tres MapResource and .tscn map files
	and register them in `_map_info`.  `category` is the subfolder name used
	to prefix entries in the displayed map list (empty for the root)."""
	var dir: DirAccess = DirAccess.open(dir_path)
	if dir == null:
		# Directory doesn't exist yet — that's fine, user hasn't saved any custom maps
		return

	dir.list_dir_begin()
	while true:
		var file_name: String = dir.get_next()
		if file_name == "":
			break

		var full_path: String = dir_path + file_name

		if dir.current_is_dir():
			# Recurse into subfolders, using the folder name as the category prefix.
			# Skip Godot import-cache and dotfiles to avoid noise.
			if file_name.begins_with(".") or file_name == "import":
				continue
			_scan_custom_maps(full_path + "/", file_name)
			continue

		if file_name.ends_with(".tres"):
			_register_tres_map(full_path, file_name, category)
		elif file_name.ends_with(".tscn"):
			_register_tscn_map(full_path, file_name, category)
	dir.list_dir_end()


func _register_tres_map(full_path: String, file_name: String, category: String) -> void:
	var res: Resource = load(full_path)
	if not (res is MapResource):
		return
	var map_res: MapResource = res
	var base_name: String = (
		map_res.map_name if not map_res.map_name.is_empty() else file_name.get_basename()
	)
	_map_info[full_path] = {
		"name": _format_display_name(base_name, category),
		"players": map_res.get_max_players(),
		"size": map_res.size,
	}


func _register_tscn_map(full_path: String, file_name: String, category: String) -> void:
	# Determine player count by counting Marker3D nodes parented to the
	# SpawnPoints group inside the .tscn text.  This avoids instantiating the
	# full scene at menu time.  Falls back to 2 if parsing fails.
	var players: int = _count_spawn_points_in_tscn(full_path)
	if players <= 0:
		players = 2
	_map_info[full_path] = {
		"name": _format_display_name(file_name.get_basename(), category),
		"players": players,
		"size": Vector2i(50, 50),  # unknown without instantiating; cosmetic only
	}


func _count_spawn_points_in_tscn(scene_path: String) -> int:
	var f: FileAccess = FileAccess.open(scene_path, FileAccess.READ)
	if f == null:
		return 0
	var count: int = 0
	while not f.eof_reached():
		var line: String = f.get_line()
		# Map.tscn has a `SpawnPoints` Node3D; markers placed under it use
		# `parent="SpawnPoints"` in the saved scene text.
		if line.begins_with("[node ") and 'parent="SpawnPoints"' in line:
			count += 1
	return count


func _format_display_name(base_name: String, category: String) -> String:
	if category.is_empty():
		return base_name
	# Capitalize first letter of the folder name for nicer display.
	var pretty_category: String = category.substr(0, 1).to_upper() + category.substr(1)
	return "[%s] %s" % [pretty_category, base_name]


func _configure_team_options(team_select: OptionButton, num_teams: int):
	# Remove all items except the first num_teams
	while team_select.item_count > num_teams:
		team_select.remove_item(team_select.item_count - 1)


func _create_match_settings():
	# Build MatchSettings from UI selections (controller type, color, team, spawn position).
	# This is called when user clicks \"Play\" in the main menu.
	var match_settings = MatchSettings.new()

	var player_settings_nodes = find_child("GridContainer").get_children()
	for player_index in range(player_settings_nodes.size()):
		var player_container = player_settings_nodes[player_index]
		var play_select = player_container.find_child("PlaySelect")
		var color_picker = player_container.find_child("ColorPickerButton")
		var team_select = player_container.find_child("TeamSelect")
		var spawn_select = player_container.find_child("SpawnSelect")
		var faction_select = player_container.find_child("FactionSelect")

		var player_controller = play_select.selected
		if player_controller != Constants.PlayerType.NONE:
			var player_settings = PlayerSettings.new()
			player_settings.controller = player_controller
			player_settings.color = color_picker.color
			# TEAM ASSIGNMENT: Read from UI selection. If 0 (default),
			# users can override team memberships for alliances.
			# Match.gd will use these team values when creating Player nodes.
			player_settings.team = team_select.selected
			player_settings.faction = faction_select.selected
			# SPAWN: 0 = Random (-1 internally), 1+ = specific spawn point (0-indexed)
			player_settings.spawn_index = spawn_select.selected - 1
			match_settings.players.append(player_settings)

	match_settings.visible_player = -1
	for player_id in range(match_settings.players.size()):
		var player = match_settings.players[player_id]
		if player.controller == Constants.PlayerType.HUMAN:
			match_settings.visible_player = player_id
	if match_settings.visible_player == -1:
		match_settings.visibility = match_settings.Visibility.ALL_PLAYERS

	return match_settings


func _get_selected_map_path():
	return _map_paths[_map_list.get_selected_items()[0]]


func _on_start_button_pressed():
	hide()
	var new_scene = LoadingScene.instantiate()
	new_scene.match_settings = _create_match_settings()
	new_scene.map_path = _get_selected_map_path()
	get_parent().add_child(new_scene)
	get_tree().current_scene = new_scene
	queue_free()


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://source/main-menu/Main.tscn")


func _align_player_controls_visibility_to_map(map):
	var grid_container = find_child("GridContainer")
	var num_players = map["players"]
	_num_spawns = num_players

	# Clear existing player settings
	for child in grid_container.get_children():
		child.queue_free()

	# Create new player settings for each spawn point
	for player_index in range(num_players):
		var player_settings_instance = PlayerSettingsScene.instantiate()
		grid_container.add_child(player_settings_instance)

		# Configure facion select
		var faction_select = player_settings_instance.find_child("FactionSelect")
		faction_select.item_selected.connect(_on_faction_selected.bind(player_index))

		# Configure team select to only show teams matching spawn points
		var team_select = player_settings_instance.find_child("TeamSelect")
		_configure_team_options(team_select, num_players)
		team_select.selected = player_index

		# Configure spawn select
		var spawn_select = player_settings_instance.find_child("SpawnSelect")
		_populate_spawn_select(spawn_select, num_players)
		spawn_select.item_selected.connect(_on_spawn_selected.bind(player_index))

		# Set default color
		var color_picker = player_settings_instance.find_child("ColorPickerButton")
		color_picker.color = Constants.COLORS[player_index % Constants.COLORS.size()]

		# Set default controller type
		var play_select = player_settings_instance.find_child("PlaySelect")
		if player_index == 0:
			play_select.selected = Constants.PlayerType.HUMAN
			var pname: String = Globals.options.player_name.strip_edges()
			play_select.set_item_text(
				Constants.PlayerType.HUMAN, pname if not pname.is_empty() else "Human"
			)
		elif player_index == 1:
			play_select.selected = Constants.PlayerType.SIMPLE_CLAIRVOYANT_AI
		play_select.item_selected.connect(_on_player_selected.bind(player_index))


func _on_player_selected(selected_option_id, selected_player_id):
	_start_button.disabled = false
	if selected_option_id == Constants.PlayerType.HUMAN:
		var player_settings_nodes = find_child("GridContainer").get_children()
		for player_index in range(player_settings_nodes.size()):
			if player_index != selected_player_id:
				var play_select = player_settings_nodes[player_index].find_child("PlaySelect")
				if play_select.selected == Constants.PlayerType.HUMAN:
					play_select.selected = Constants.PlayerType.SIMPLE_CLAIRVOYANT_AI
	elif selected_option_id == Constants.PlayerType.NONE:
		var player_settings_nodes = find_child("GridContainer").get_children()
		var human_count = 0
		for player_container in player_settings_nodes:
			var play_select = player_container.find_child("PlaySelect")
			if play_select.selected != Constants.PlayerType.NONE:
				human_count += 1
		if human_count < 2:
			_start_button.disabled = true


func _on_map_list_item_selected(index):
	var map_path = _map_paths[index]
	var map = _map_info[map_path]

	# set the map description text
	_map_details.text = "[u]{0}[/u]\n[u]Players:[/u] {1}\n[u]Size:[/u] {2}x{3}".format(
		[map["name"], map["players"], map["size"].x, map["size"].y]
	)

	# Update map preview
	if map_path.ends_with(".tres"):
		_map_preview.set_map_data_from_resource(map_path)
	else:
		_map_preview.set_map_data(map_path)

	# Generate player settings for each spawn point
	_align_player_controls_visibility_to_map(map)

	# Reset start button state
	_start_button.disabled = false


func _populate_spawn_select(spawn_select: OptionButton, num_spawns: int) -> void:
	spawn_select.clear()
	spawn_select.add_item("Random", 0)
	for i in range(num_spawns):
		spawn_select.add_item("Pos " + str(i + 1), i + 1)
	spawn_select.selected = 0


func _on_spawn_selected(_selected_id: int, _player_index: int) -> void:
	# Enforce uniqueness: if a player picked a non-random spawn, clear any
	# other player that had the same spawn selected.
	var player_settings_nodes = find_child("GridContainer").get_children()
	if _selected_id == 0:
		return  # "Random" never conflicts
	for i in range(player_settings_nodes.size()):
		if i == _player_index:
			continue
		var other_spawn = player_settings_nodes[i].find_child("SpawnSelect")
		if other_spawn.selected == _selected_id:
			other_spawn.selected = 0  # reset to Random


func _on_faction_selected(_selected_id: int, _player_index: int) -> void:
	pass


func _start_from_replay():
	hide()
	var loading = LoadingScene.instantiate()
	loading.match_settings = replay_resource.settings
	loading.map_path = replay_resource.map
	loading.replay_resource = replay_resource
	# change_scene_to_node() expects a fresh node that is NOT inside the tree yet.
	get_tree().change_scene_to_node(loading)
