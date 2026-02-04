extends Node

var commands := {} # tick -> Array[Command]

func push_command(cmd: Dictionary):
	var t: int = cmd.tick
	if not commands.has(t):
		commands[t] = []
	commands[t].append(cmd)

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
