# Placeholder: Scrap Walker. Heavy anti-air and anti-ground fire support walker.
# TODOs: dual weapon, anti-air priority, salvaged tech upgrades.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
