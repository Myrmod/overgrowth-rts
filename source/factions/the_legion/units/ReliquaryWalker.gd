# Placeholder: Reliquary Walker. Slow heavy walker with army aura.
# TODOs: walking gait, aura broadcast, mobile shrine fx.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
