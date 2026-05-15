# Placeholder: Mechanic. Repairs allies, places mines, supports convoys.
# TODOs: repair beam, mine deploy, mine sweeper upgrade.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
