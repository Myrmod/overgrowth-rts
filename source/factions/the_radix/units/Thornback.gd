# Placeholder: Thornback. Anti-armor projectile beast.
# TODOs: piercing thorn projectile, slow attack rate, anti-vehicle bonus.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
