class_name EntityPalette

extends VBoxContainer

## Automatically generates and manages the entity palette for the map editor
## Populated from UnitConstants for structures and units

signal entity_selected(entity_type: String, scene_path: String)
signal brush_selected(brush_name: String)

const UnitConstants = preload("res://source/match/MatchConstants/Units.gd")

# Palette categories (now MenuButtons)
var _structures_menu: MenuButton
var _units_menu: MenuButton
var _brushes_menu: MenuButton
var _current_selection: MenuButton = null


func _ready():
	_build_palette()


func _build_palette():
	"""Build the palette UI from constants"""
	# Clear existing children
	for child in get_children():
		child.queue_free()

	# Brushes Menu
	_brushes_menu = MenuButton.new()
	_brushes_menu.text = "Brushes"
	_brushes_menu.flat = true
	_brushes_menu.add_theme_color_override("font_color", Color(0.9, 0.9, 0.9))
	_brushes_menu.add_theme_color_override("font_color_hover", Color(1, 1, 1))
	_brushes_menu.add_theme_color_override("font_color_pressed", Color(0.7, 0.7, 0.7))
	var brushes_popup = _brushes_menu.get_popup()
	brushes_popup.add_item("Paint Collision", 0)
	brushes_popup.add_item("Erase", 1)
	brushes_popup.id_pressed.connect(_on_brush_menu_selected)
	add_child(_brushes_menu)

	var sep1 = HSeparator.new()
	sep1.add_theme_constant_override("separation", 2)
	add_child(sep1)

	# Structures Menu
	_structures_menu = MenuButton.new()
	_structures_menu.text = "Structures"
	_structures_menu.flat = true
	_structures_menu.add_theme_color_override("font_color", Color(0.9, 0.9, 0.9))
	_structures_menu.add_theme_color_override("font_color_hover", Color(1, 1, 1))
	_structures_menu.add_theme_color_override("font_color_pressed", Color(0.7, 0.7, 0.7))
	var structures_popup = _structures_menu.get_popup()
	_populate_structures(structures_popup)
	structures_popup.id_pressed.connect(_on_structures_menu_selected)
	add_child(_structures_menu)

	var sep2 = HSeparator.new()
	sep2.add_theme_constant_override("separation", 2)
	add_child(sep2)

	# Units Menu
	_units_menu = MenuButton.new()
	_units_menu.text = "Units"
	_units_menu.flat = true
	_units_menu.add_theme_color_override("font_color", Color(0.9, 0.9, 0.9))
	_units_menu.add_theme_color_override("font_color_hover", Color(1, 1, 1))
	_units_menu.add_theme_color_override("font_color_pressed", Color(0.7, 0.7, 0.7))
	var units_popup = _units_menu.get_popup()
	_populate_units(units_popup)
	units_popup.id_pressed.connect(_on_units_menu_selected)
	add_child(_units_menu)


# No longer needed: _add_brush_button


func _on_brush_menu_selected(id: int):
	var brush_name = ""
	match id:
		0:
			brush_name = "paint_collision"
		1:
			brush_name = "erase"
	_set_current_selection(_brushes_menu)
	brush_selected.emit(brush_name)


func _populate_structures(popup: PopupMenu):
	"""Populate structure menu items from UnitConstants"""
	var structure_paths = UnitConstants.STRUCTURE_BLUEPRINTS.keys()
	var idx = 0
	for path in structure_paths:
		var structure_name = path.get_file().get_basename()
		popup.add_item(structure_name, idx)
		popup.set_item_metadata(idx, {"entity_type": "structure", "scene_path": path})
		idx += 1


func _populate_units(popup: PopupMenu):
	"""Populate unit menu items from UnitConstants"""
	var unit_paths = UnitConstants.DEFAULT_PROPERTIES.keys()
	var idx = 0
	for path in unit_paths:
		# Skip structures (they have blueprints)
		if path in UnitConstants.STRUCTURE_BLUEPRINTS:
			continue
		var unit_name = path.get_file().get_basename()
		popup.add_item(unit_name, idx)
		popup.set_item_metadata(idx, {"entity_type": "unit", "scene_path": path})
		idx += 1


# No longer needed: _add_entity_button


func _on_structures_menu_selected(id: int):
	var meta = _structures_menu.get_popup().get_item_metadata(id)
	if meta:
		_set_current_selection(_structures_menu)
		entity_selected.emit(meta["entity_type"], meta["scene_path"])


func _on_units_menu_selected(id: int):
	var meta = _units_menu.get_popup().get_item_metadata(id)
	if meta:
		_set_current_selection(_units_menu)
		entity_selected.emit(meta["entity_type"], meta["scene_path"])


func _set_current_selection(menu: MenuButton):
	"""Update the current selection highlighting"""
	if _current_selection and _current_selection != menu:
		_current_selection.button_pressed = false
		_current_selection.add_theme_color_override("font_color", Color(0.9, 0.9, 0.9))
	_current_selection = menu
	if _current_selection:
		_current_selection.button_pressed = true
		_current_selection.add_theme_color_override("font_color", Color(1, 0.8, 0.2))  # Highlight color
