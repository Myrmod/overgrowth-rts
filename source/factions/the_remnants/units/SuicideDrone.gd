# Placeholder: Suicide Drone. Cheap telegraphed explosive drone.
# TODOs: kamikaze run, AoE detonation, detection vulnerability.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
