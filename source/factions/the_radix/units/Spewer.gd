# Placeholder: Spewer. Long-range siege from creep lines.
# TODOs: lobbed siege projectile w/ AoE; weak/immobile off creep.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
