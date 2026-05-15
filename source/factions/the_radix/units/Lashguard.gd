# Placeholder: Lashguard. Melee frontline shield; tougher on creep.
# TODOs: creep-bonus armor; taunt/leash hook for blocking.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
