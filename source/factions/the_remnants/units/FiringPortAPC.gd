# Placeholder: Firing-Port APC. Transports infantry; passengers can shoot out.
# TODOs: garrison logic, firing-port shots, deploy/undeploy.
extends "res://source/match/units/Unit.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	await super()
	default_idle_action_scene = WaitingForTargets
