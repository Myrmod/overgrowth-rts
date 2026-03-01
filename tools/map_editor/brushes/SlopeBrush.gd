class_name SlopeBrush

extends EditorBrush

## Brush for painting slopes between height levels.
## Slopes interpolate the height from neighbouring cells and
## remove collision so units can walk across the transition.


func _init(
	map_res: MapResource = null,
	symmetry_sys: SymmetrySystem = null,
	cmd_stack: CommandStack = null,
):
	super._init(map_res, symmetry_sys, cmd_stack)


func apply(cell_pos: Vector2i):
	if not can_apply(cell_pos):
		return

	var affected_positions = get_affected_positions(cell_pos)

	var cmd = PaintSlopeCommand.new(map_resource, affected_positions)
	command_stack.push_command(cmd)

	brush_applied.emit(affected_positions)


func get_brush_name() -> String:
	return "Slope Brush"


func get_cursor_color() -> Color:
	return Color(0.9, 0.7, 0.2, 0.8)
