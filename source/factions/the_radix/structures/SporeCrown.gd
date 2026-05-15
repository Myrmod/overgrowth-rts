# Placeholder: Spore Crown. Anti-air defence over groves.
# TODOs: rapid-fire spore projectile; air-only target filter.
extends "res://source/factions/the_radix/structures/RadixSeedlingStartedStructure.gd"

const WaitingForTargets = preload("res://source/match/units/actions/WaitingForTargets.gd")


func _ready():
	await super()
	if not is_constructed():
		await constructed
	if action == null:
		action = WaitingForTargets.new()


func _set_action(action_node):
	if not _action_locked and action == null:
		super(action_node)
	elif action_node != null:
		action_node.queue_free()
