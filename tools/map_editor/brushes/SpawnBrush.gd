class_name SpawnBrush

extends EditorBrush

## Brush for placing player spawn points on the map


func apply(cell_pos: Vector2i):
	if not can_apply(cell_pos):
		return

	# Spawn points ignore symmetry and size — always single cell
	var cmd = PlaceSpawnCommand.new(map_resource, cell_pos)
	command_stack.push_command(cmd)

	var affected: Array[Vector2i] = [cell_pos]
	brush_applied.emit(affected)


func get_brush_name() -> String:
	var count = map_resource.spawn_points.size() if map_resource else 0
	return "Spawn Point (%d placed)" % count


func get_cursor_color() -> Color:
	return Color.YELLOW


func _build_footprint(center: Vector2i) -> Array[Vector2i]:
	return [center]
