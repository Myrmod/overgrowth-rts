extends "res://source/match/units/Structure.gd"

## Neutral biomechanical structure that converts ambient vine energy into
## resources for its owning Player.  Grants `credits_per_tick` credits to the
## owning player every match tick when active and constructed.  Triggers or
## map-editor authored maps may set `income_disabled` to suppress income
## without removing the structure.

const _CONSTANTS_SCENE_PATH: String = "res://source/factions/neutral/structures/VineEnergyProcessor/VineEnergyProcessor.tscn"

## Credits granted to the owning player every Match tick.
@export var credits_per_tick: int = 1

## When true, this processor stops granting income (used by triggers or map
## authors that want to drive the economy themselves).
@export var income_disabled: bool = false


func _ready() -> void:
	super()
	MatchSignals.tick_advanced.connect(_on_tick_advanced)


func _on_tick_advanced() -> void:
	if income_disabled:
		return
	if is_under_construction() or is_disabled or is_selling:
		return
	if player == null or not (player is Player):
		return
	if credits_per_tick == 0:
		return
	player.credits = player.credits + credits_per_tick
