# Placeholder: Mortar Truck. Siege vs static defences and shrine camps.
# TODOs: deploy mode, indirect arc, slow reload.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
