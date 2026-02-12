extends GridHotkeys

const Structure = preload("res://source/match/units/Structure.gd")

var units = []

func _ready():
	super._ready()

func _on_cancel_action_button_pressed():
	if len(units) == 1 and units[0] is Structure and units[0].is_under_construction():
		units[0].cancel_construction()
		return
	for unit in units:
		CommandBus.push_command({
			"tick": Match.tick + 1,
			"type": Enums.CommandType.ACTION_CANCEL,
			"data": {
				"targets": [{"unit": unit.id, "pos": unit.global_position, "rot": unit.global_rotation}],
			}
		})
