# Placeholder: Salvage Van. Gathers scrap dropped by destroyed enemy vehicles and air units.
# TODOs: scrap pickup, return-to-yard logic.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
