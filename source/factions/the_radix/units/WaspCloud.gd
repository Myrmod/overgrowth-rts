# Placeholder: Wasp Cloud. T2 swarm air harasser.
# TODOs: numerous-fragile body, anti-worker bias, no air-vs-air strength.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
