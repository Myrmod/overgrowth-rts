# Flak: anti-air defence turret for the Remnants faction.
# TODOs: AA-only target filter, lead-fire correction.
extends "res://source/match/units/Structure.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready() -> void:
	super()
	find_child("Geometry").visible = visible
	visibility_changed.connect(func(): find_child("Geometry").visible = visible)
	if not is_constructed():
		await constructed
	action = WaitingForTargets.new()


func _set_action(action_node) -> void:
	if not _action_locked and action == null:
		super(action_node)
	elif action_node != null:
		action_node.queue_free()
