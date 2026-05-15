# Placeholder: Sanctifier Tank. Durable general-purpose midgame armor.
# TODOs: turret cannon projectile, doctrine upgrades.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
