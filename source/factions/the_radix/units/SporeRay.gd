# Placeholder: Spore Ray. T2 anti-air specialist.
# TODOs: anti-air-only, projectile burst, gunship counter.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
