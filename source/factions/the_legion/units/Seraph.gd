# Placeholder: Seraph. Air harasser; strong vs ground infantry and air.
# TODOs: dual-mode attack, strafing pattern.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
