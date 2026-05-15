# Placeholder: Chaplain Medic. Sustain and morale aura support.
# TODOs: heal beam, non-stacking morale aura.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
