# Placeholder: Gaya. Late T3 caster; crowd control / fragile.
# TODOs: root/entangle cast, fragile body, single-target lockdown.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
