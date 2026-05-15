# Placeholder: Yggdrasil. T3 capital land beast; iconic late army anchor.
# TODOs: heavy multi-attack, slow speed, area regen aura.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
