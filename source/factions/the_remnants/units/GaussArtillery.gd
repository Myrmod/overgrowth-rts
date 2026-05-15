# Placeholder: Gauss Artillery. Anti-turtle finisher; long-warning siege gun.
# TODOs: long charge time, devastating impact, no minimum range.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
