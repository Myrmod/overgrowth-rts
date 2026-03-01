class_name EntityBrush

extends EditorBrush

## Brush for placing entities
## Blocks placement on slopes and water unless the entity has
## allow_slope_placement / allow_water_placement set to true.

var scene_path: String = ""
var player_id: int = 0
var rotation: float = 0.0

# Cached placement flags from the loaded scene
var _allow_slope_placement: bool = false
var _allow_water_placement: bool = false


func _init(
	map_res: MapResource = null,
	symmetry_sys: SymmetrySystem = null,
	cmd_stack: CommandStack = null,
	entity_path: String = "",
	player: int = 0
):
	super._init(map_res, symmetry_sys, cmd_stack)
	scene_path = entity_path
	player_id = player
	_refresh_placement_flags()


func apply(cell_pos: Vector2i):
	if not can_apply(cell_pos):
		return

	if scene_path.is_empty():
		push_warning("EntityBrush: No entity scene path set")
		return

	# Validate terrain type at target cell
	if map_resource:
		var cell_type = map_resource.get_cell_type_at(cell_pos)
		if cell_type == MapResource.CELL_SLOPE and not _allow_slope_placement:
			push_warning("Cannot place entity on a slope (entity does not allow slope placement)")
			return
		if cell_type == MapResource.CELL_WATER and not _allow_water_placement:
			push_warning("Cannot place entity on water (entity does not allow water placement)")
			return

	var affected_positions = get_affected_positions(cell_pos)

	var cmd = PlaceEntityCommand.new(
		map_resource, affected_positions, scene_path, player_id, rotation
	)

	command_stack.push_command(cmd)

	brush_applied.emit(affected_positions)


func set_entity(path: String):
	scene_path = path
	_refresh_placement_flags()


func set_player(player: int):
	player_id = player


func set_rotation(rot: float):
	rotation = rot


func _refresh_placement_flags():
	"""Check the entity scene for allow_slope_placement / allow_water_placement."""
	_allow_slope_placement = false
	_allow_water_placement = false

	if scene_path.is_empty():
		return

	var packed = load(scene_path)
	if not packed:
		return

	var inst = packed.instantiate()
	if inst.get("allow_slope_placement") != null:
		_allow_slope_placement = inst.allow_slope_placement
	if inst.get("allow_water_placement") != null:
		_allow_water_placement = inst.allow_water_placement
	inst.queue_free()


func get_brush_name() -> String:
	if scene_path.is_empty():
		return "Entity (None Selected)"
	var entity_name = scene_path.get_file().get_basename()
	return "Entity: " + entity_name


func get_cursor_color() -> Color:
	return Color.CYAN


func _build_footprint(center: Vector2i) -> Array[Vector2i]:
	return [center]
