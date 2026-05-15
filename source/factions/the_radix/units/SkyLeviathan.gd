# Placeholder: Sky Leviathan. T3 capital air organism.
# TODOs: massive HP, slow, multi-target spore strafe, expensive.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
	action = WaitingForTargets.new()
