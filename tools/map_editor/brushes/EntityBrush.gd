class_name EntityBrush

extends EditorBrush

## Brush for placing entities

var scene_path: String = ""
var player_id: int = 0
var rotation: float = 0.0


func _init(
	map_res: MapResource = null,
	symmetry_sys: SymmetrySystem = null,
	cmd_stack: CommandStack = null,
	entity_path: String = "",
	player: int = 0
):
	print("Initializing EntityBrush with cmd_stack: ", cmd_stack)
	super._init(map_res, symmetry_sys, cmd_stack)
	scene_path = entity_path
	player_id = player


func apply(cell_pos: Vector2i):
	print("Applying EntityBrush at ", cell_pos)

	if not can_apply(cell_pos):
		return

	if scene_path.is_empty():
		push_warning("EntityBrush: No entity scene path set")
		return

	var affected_positions = get_affected_positions(cell_pos)

	var cmd = PlaceEntityCommand.new(
		map_resource, affected_positions, scene_path, player_id, rotation
	)

	command_stack.push_command(cmd)

	brush_applied.emit(affected_positions)


func set_entity(path: String):
	scene_path = path


func set_player(player: int):
	player_id = player


func set_rotation(rot: float):
	rotation = rot


func get_brush_name() -> String:
	if scene_path.is_empty():
		return "Entity (None Selected)"
	var entity_name = scene_path.get_file().get_basename()
	return "Entity: " + entity_name


func get_cursor_color() -> Color:
	return Color.CYAN
