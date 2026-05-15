# Placeholder: Archangel Gunship. T3 capital air finisher.
# TODOs: multi-weapon turret, dramatic finisher fx.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
