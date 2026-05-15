# Placeholder: Heavy Lift Rotor. Late transport, extraction, and vehicle deployment.
# TODOs: vehicle pickup, large transport bay, slow speed.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
