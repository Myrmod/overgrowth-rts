# Placeholder: Acolyte Guard. Disciplined melee frontline blocker.
# TODOs: shield-bash, group formation hold.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
