extends Node

var _next_id := 1
var entities := {} # int -> Unit
var entity_id: int

func register(unit) -> int:
	var id := _next_id
	_next_id += 1
	entities[id] = unit
	return id

func get_unit(id: int):
	return entities.get(id, null)

## has to be called on unit death
func unregister(_unit):
	entities.erase(_unit.id)
