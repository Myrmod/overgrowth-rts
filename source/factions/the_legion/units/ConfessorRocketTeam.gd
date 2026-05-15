# Placeholder: Confessor Rocket Team. Anti-armor/anti-air rocket squad.
# TODOs: rocket projectile, dual ground/air targeting.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
