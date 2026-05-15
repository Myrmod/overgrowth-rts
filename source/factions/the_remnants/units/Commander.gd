# Placeholder: Commander. Buffs nearby allied damage and speed; non-stacking aura.
# TODOs: aura visualization, ability cooldowns, leadership bonus.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
