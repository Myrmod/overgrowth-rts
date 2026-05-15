# Placeholder: Acid Spewer turret. Anti-infantry corrosive defence.
# TODOs: corrosive splash/DoT projectile; tune anti-light damage.
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
