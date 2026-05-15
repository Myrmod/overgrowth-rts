# Placeholder: Sporecaster. AoE anti-infantry/zone denial caster.
# TODOs: AoE spore projectile w/ telegraph; suppression debuff.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
