# Placeholder: Purifier Squad. AoE corrosive anti-swarm and feral-growth cleanser.
# TODOs: AoE corrosive cone, vine clearing.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
