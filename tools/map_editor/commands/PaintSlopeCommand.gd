class_name PaintSlopeCommand

extends EditorCommand

## Command for painting slope cells with undo support.
## Slopes interpolate between adjacent height levels, clear collision
## so units can traverse them, and mark the cell type as SLOPE so
## buildings cannot be placed here (unless they opt in).

var map_resource: MapResource
var positions: Array[Vector2i]

# For undo
var old_heights: Array[float]
var old_collisions: Array[int]
var old_cell_types: Array[int]

# New computed values per position
var new_heights: Array[float]


func _init(map_res: MapResource, affected_positions: Array[Vector2i]):
	map_resource = map_res
	positions = affected_positions.duplicate()
	old_heights = []
	old_collisions = []
	old_cell_types = []
	new_heights = []

	# Store old values and compute slope heights
	for pos in positions:
		old_heights.append(map_res.get_height_at(pos))
		old_collisions.append(map_res.get_collision_at(pos))
		old_cell_types.append(map_res.get_cell_type_at(pos))

		# Compute the interpolated slope height from neighbours
		var slope_h = _compute_slope_height(map_res, pos)
		new_heights.append(slope_h)

	description = "Paint Slope (%d cells)" % positions.size()


func _compute_slope_height(map_res: MapResource, pos: Vector2i) -> float:
	## Average the heights of all 4-connected neighbours to create a
	## smooth transition.  If the cell has no neighbours with different
	## heights the value stays the same as the current cell.
	var neighbours := [
		Vector2i(pos.x - 1, pos.y),
		Vector2i(pos.x + 1, pos.y),
		Vector2i(pos.x, pos.y - 1),
		Vector2i(pos.x, pos.y + 1),
	]

	var total := 0.0
	var count := 0

	for n in neighbours:
		if n.x < 0 or n.x >= map_res.size.x or n.y < 0 or n.y >= map_res.size.y:
			continue
		total += map_res.get_height_at(n)
		count += 1

	if count == 0:
		return map_res.get_height_at(pos)

	return total / float(count)


func execute():
	for i in range(positions.size()):
		map_resource.set_height_at(positions[i], new_heights[i])
		# Slopes are always traversable and marked as SLOPE type
		map_resource.set_collision_at(positions[i], 0)
		map_resource.set_cell_type_at(positions[i], MapResource.CELL_SLOPE)


func undo():
	for i in range(positions.size()):
		map_resource.set_height_at(positions[i], old_heights[i])
		map_resource.set_collision_at(positions[i], old_collisions[i])
		map_resource.set_cell_type_at(positions[i], old_cell_types[i])
