class_name PlaceTextureCommand

extends EditorCommand

## Command for placing entities (structures, units, resources) with undo support

var map_resource: MapResource
var positions: Array[Vector2i]
var terrain: TerrainType
var rotation: float
var terrain_id: int
var previous_values := []


func _init(map_res, _positions, texture: TerrainType, _rotation):
	map_resource = map_res
	positions = _positions
	terrain_id = texture.id


func execute():
	previous_values.clear()

	for pos in positions:
		var index = pos.y * map_resource.size.x + pos.x
		previous_values.append(map_resource.terrain_grid[index])
		map_resource.terrain_grid[index] = terrain_id


func undo():
	for i in range(positions.size()):
		var pos = positions[i]
		var index = pos.y * map_resource.size.x + pos.x
		map_resource.terrain_grid[index] = previous_values[i]
