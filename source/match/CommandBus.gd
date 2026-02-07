extends Node

var commands := {} # tick -> Array[Command]

func push_command(cmd: Dictionary):
	var t: int = cmd.tick
	if not commands.has(t):
		commands[t] = []
	commands[t].append(cmd)
	ReplayRecorder.record_command(cmd)

func get_commands_for_tick(tick: int) -> Array:
	if ReplayRecorder.mode == ReplayRecorder.Mode.PLAY:
		return _replay_commands_for_tick(tick)
	else:
		return _live_commands_for_tick(tick)

func _replay_commands_for_tick(tick: int) -> Array:
	var result := []
	for cmd in ReplayRecorder.replay.commands:
		if cmd.tick == tick:
			result.append(cmd)
	return result

func _live_commands_for_tick(tick: int) -> Array:
	return commands[tick]

func load_from_replay_array(arr: Array):
	commands.clear()

	for entry in arr:
		var tick = entry.tick
		var cmd = entry

		if not commands.has(tick):
			commands[tick] = []

		commands[tick].append(cmd)
