# Placeholder: Burrower. Burrow ambush vehicle.
# TODOs: deterministic burrow rules; surface-attack action; detection vulnerability.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
