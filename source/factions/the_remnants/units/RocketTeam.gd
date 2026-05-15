# Placeholder: Rocket Team. Anti-armor and basic anti-air infantry.
# TODOs: pack-up move, rocket arc, dual-target mode.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
