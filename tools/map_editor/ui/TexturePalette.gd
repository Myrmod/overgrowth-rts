class_name TexturePalette

extends VBoxContainer

## Automatically generates and manages the texture palette for the map editor

signal texture_selected(scene_path: String)

@export var terrain_library: TerrainLibrary

# Faction container
@onready var texture_container = $GridContainer


func _ready():
	populate_textures()


func populate_textures():
	if not texture_container:
		push_error("The texture_container not found in the scene tree.")
		return

	# Clear existing buttons if reloading
	for c in texture_container.get_children():
		c.queue_free()

	for t in terrain_library.terrain_types:
		create_scene_button(t, texture_container)


func create_scene_button(texture: TerrainType, container: Node):
	var btn := TextureButton.new()

	btn.texture_normal = texture.preview
	btn.ignore_texture_size = true
	btn.stretch_mode = btn.StretchMode.STRETCH_SCALE
	btn.custom_minimum_size = Vector2(138, 138)

	btn.pressed.connect(_on_scene_button_pressed.bind(texture))

	container.add_child(btn)


func _on_scene_button_pressed(texture: TerrainType):
	texture_selected.emit(texture)
