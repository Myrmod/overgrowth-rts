extends "res://source/match/units/Structure.gd"

## Neutral biomechanical structure that boosts the owning player's production
## speed by a flat additive multiplier (default +10% per active laboratory).
##
## The boost is applied once on construction-finish and removed when the
## structure leaves the tree (destroyed, sold, ownership transfer, ...).
## Multiple labs stack additively: 3 labs \u2192 player.production_speed_multiplier
## becomes 1.30.
##
## `speed_bonus` may be tuned per-instance via the map editor or by triggers.

const _CONSTANTS_SCENE_PATH: String = "res://source/factions/neutral/structures/VineTechLaboratory/VineTechLaboratory.tscn"

## Additive bonus applied to the owning player's production_speed_multiplier.
@export var speed_bonus: float = 0.10

var _bonus_applied: bool = false
var _bonus_target: Player = null


func _ready() -> void:
	super()
	# Apply on completion if the structure spawns already-built (pre-placed map
	# structures, save load).  For build-on-field structures the `constructed`
	# signal fires once construction completes.
	if not is_under_construction():
		_apply_bonus()
	if not constructed.is_connected(_apply_bonus):
		constructed.connect(_apply_bonus)
	tree_exiting.connect(_remove_bonus)


func _apply_bonus() -> void:
	if _bonus_applied:
		return
	if player == null or not (player is Player):
		return
	_bonus_target = player
	_bonus_target.production_speed_multiplier = (
		_bonus_target.production_speed_multiplier + speed_bonus
	)
	_bonus_applied = true


func _remove_bonus() -> void:
	if not _bonus_applied:
		return
	if _bonus_target != null and is_instance_valid(_bonus_target):
		_bonus_target.production_speed_multiplier = (
			_bonus_target.production_speed_multiplier - speed_bonus
		)
	_bonus_applied = false
	_bonus_target = null
