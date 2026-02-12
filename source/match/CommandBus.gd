# CommandBus: Central command queue and execution manager
# 
# This system ensures deterministic game behavior by routing all game-changing actions
# through a single command queue. This enables:
# - Perfect replay functionality (record and replay identical command sequences)
# - Future multiplayer support (all clients execute same commands in same order)
# - Save/load capability (resume from checkpoint)
#
# Both human players and AI must push commands here instead of directly modifying
# game state. Match._execute_command() then applies these commands each tick.

extends Node

# Command queue indexed by tick number
# Structure: { tick: [command_dict, command_dict, ...] }
var commands := {} # tick -> Array[Command]

# Clear all queued commands - used when starting a fresh live match
func clear():
	# Clear all stored commands
	commands.clear()


func _is_serializable_value(value: Variant) -> bool:
	var value_type = typeof(value)
	var allowed_types = [
		TYPE_NIL,
		TYPE_BOOL,
		TYPE_INT,
		TYPE_FLOAT,
		TYPE_STRING,
		TYPE_STRING_NAME,
		TYPE_VECTOR2,
		TYPE_VECTOR2I,
		TYPE_RECT2,
		TYPE_RECT2I,
		TYPE_VECTOR3,
		TYPE_VECTOR3I,
		TYPE_TRANSFORM2D,
		TYPE_VECTOR4,
		TYPE_VECTOR4I,
		TYPE_PLANE,
		TYPE_QUATERNION,
		TYPE_AABB,
		TYPE_BASIS,
		TYPE_TRANSFORM3D,
		TYPE_PROJECTION,
		TYPE_COLOR,
		TYPE_NODE_PATH,
		TYPE_DICTIONARY,
		TYPE_ARRAY,
		TYPE_PACKED_BYTE_ARRAY,
		TYPE_PACKED_INT32_ARRAY,
		TYPE_PACKED_INT64_ARRAY,
		TYPE_PACKED_FLOAT32_ARRAY,
		TYPE_PACKED_FLOAT64_ARRAY,
		TYPE_PACKED_STRING_ARRAY,
		TYPE_PACKED_VECTOR2_ARRAY,
		TYPE_PACKED_VECTOR3_ARRAY,
		TYPE_PACKED_COLOR_ARRAY,
	]
	if not allowed_types.has(value_type):
		return false

	if value_type == TYPE_ARRAY:
		for element in value:
			if not _is_serializable_value(element):
				return false
		return true

	if value_type == TYPE_DICTIONARY:
		for key in value.keys():
			if not _is_serializable_value(key):
				return false
			if not _is_serializable_value(value[key]):
				return false
		return true

	return true


func _validate_target_dict(entry: Variant, command_name: String, require_pos: bool) -> bool:
	if typeof(entry) != TYPE_DICTIONARY:
		push_error("CommandBus: %s target entry must be Dictionary" % command_name)
		return false
	if not entry.has("unit") or typeof(entry["unit"]) != TYPE_INT:
		push_error("CommandBus: %s target entry must contain int 'unit'" % command_name)
		return false
	if require_pos and (not entry.has("pos") or typeof(entry["pos"]) != TYPE_VECTOR3):
		push_error("CommandBus: %s target entry must contain Vector3 'pos'" % command_name)
		return false
	if entry.has("pos") and entry["pos"] != null and typeof(entry["pos"]) != TYPE_VECTOR3:
		push_error("CommandBus: %s target entry 'pos' must be Vector3 when present" % command_name)
		return false
	if entry.has("rot") and entry["rot"] != null and typeof(entry["rot"]) != TYPE_VECTOR3:
		push_error("CommandBus: %s target entry 'rot' must be Vector3 when present" % command_name)
		return false
	return true


func _validate_command_schema(cmd: Dictionary) -> bool:
	match cmd.type:
		Enums.CommandType.MOVE:
			if not cmd.data.has("targets") or typeof(cmd.data.targets) != TYPE_ARRAY:
				push_error("CommandBus: MOVE requires Array data.targets")
				return false
			for entry in cmd.data.targets:
				if not _validate_target_dict(entry, "MOVE", true):
					return false
		Enums.CommandType.MOVING_TO_UNIT, Enums.CommandType.FOLLOWING, Enums.CommandType.COLLECTING_RESOURCES_SEQUENTIALLY, Enums.CommandType.AUTO_ATTACKING:
			if not cmd.data.has("target_unit") or typeof(cmd.data.target_unit) != TYPE_INT:
				push_error("CommandBus: command requires int data.target_unit")
				return false
			if not cmd.data.has("targets") or typeof(cmd.data.targets) != TYPE_ARRAY:
				push_error("CommandBus: command requires Array data.targets")
				return false
			for entry in cmd.data.targets:
				if not _validate_target_dict(entry, "TARGETED_ACTION", false):
					return false
		Enums.CommandType.CONSTRUCTING:
			if not cmd.data.has("structure") or typeof(cmd.data.structure) != TYPE_INT:
				push_error("CommandBus: CONSTRUCTING requires int data.structure")
				return false
			if not cmd.data.has("selected_constructors") or typeof(cmd.data.selected_constructors) != TYPE_ARRAY:
				push_error("CommandBus: CONSTRUCTING requires Array data.selected_constructors")
				return false
			for entry in cmd.data.selected_constructors:
				if not _validate_target_dict(entry, "CONSTRUCTING", false):
					return false
		Enums.CommandType.ACTION_CANCEL:
			if not cmd.data.has("targets") or typeof(cmd.data.targets) != TYPE_ARRAY:
				push_error("CommandBus: ACTION_CANCEL requires Array data.targets")
				return false
			for entry in cmd.data.targets:
				if not _validate_target_dict(entry, "ACTION_CANCEL", false):
					return false
		_:
			pass
	return true


func _is_valid_command(cmd: Variant) -> bool:
	if typeof(cmd) != TYPE_DICTIONARY:
		push_error("CommandBus: command must be a Dictionary")
		return false
	if not cmd.has("tick") or typeof(cmd.tick) != TYPE_INT:
		push_error("CommandBus: command missing int tick")
		return false
	if not cmd.has("type") or typeof(cmd.type) != TYPE_INT:
		push_error("CommandBus: command missing int type")
		return false
	if not cmd.has("data") or typeof(cmd.data) != TYPE_DICTIONARY:
		push_error("CommandBus: command missing Dictionary data")
		return false
	if not _is_serializable_value(cmd):
		push_error("CommandBus: command contains non-serializable values or object references")
		return false
	if not _validate_command_schema(cmd):
		return false
	return true


func push_command(cmd: Dictionary):
	if not _is_valid_command(cmd):
		return
	var t: int = cmd.tick
	if not commands.has(t):
		commands[t] = []
	commands[t].append(cmd)
	# Record command for replay capability
	ReplayRecorder.record_command(cmd)

func get_commands_for_tick(tick: int) -> Array:
	# During replay playback, retrieve commands from loaded replay data
	# During live play, retrieve commands from the local queue
	if ReplayRecorder.mode == ReplayRecorder.Mode.PLAY:
		return _replay_commands_for_tick(tick)
	else:
		return _live_commands_for_tick(tick)

func _replay_commands_for_tick(tick: int) -> Array:
	# Extract all commands recorded for this tick from the replay file
	var result := []
	for cmd in ReplayRecorder.replay.commands:
		if cmd.tick == tick:
			result.append(cmd)
	return result

func _live_commands_for_tick(tick: int) -> Array:
	# Get commands queued for this tick during live gameplay
	if not commands.has(tick):
		return []
	return commands[tick]

func load_from_replay_array(arr: Array):
	# Load replay commands into the queue for playback
	# Called when user selects a replay from the menu
	commands.clear()

	for entry in arr:
		var tick = entry.tick
		var cmd = entry

		if not commands.has(tick):
			commands[tick] = []

		commands[tick].append(cmd)
