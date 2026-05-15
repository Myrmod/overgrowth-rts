# Placeholder: Militia Rifle Squad. Cheap core DPS infantry.
# TODOs: squad logic, suppress, civilian-defense buffs.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
