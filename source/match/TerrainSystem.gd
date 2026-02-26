class_name TerrainSystem

extends Node3D

# we need to define that, since shaders can't be too dynamic
const MAX_TERRAINS := 16

@export var base_layer: TerrainType = Globals.terrain_types.front()

var size: Vector2i
var map: MapResource
var splat_images: Array[Image] = []
var splat_textures: Array[Texture2D] = []


func set_map(_map: MapResource):
	map = _map
	size = map.size

	if not $TerrainMesh.mesh:
		var plane := PlaneMesh.new()
		plane.size = _map.size
		plane.subdivide_width = map.size.x - 1
		plane.subdivide_depth = map.size.y - 1
		$TerrainMesh.mesh = plane

		# we need to properly set the position of the created mesh
		$TerrainMesh.position = Vector3(map.size.x / 2.0, 0, map.size.y / 2.0)

	if not $WaterMesh.mesh:
		var plane := PlaneMesh.new()
		plane.size = _map.size
		$WaterMesh.mesh = plane

		# we need to properly set the position of the created mesh
		$WaterMesh.position = Vector3(map.size.x / 2.0, 0, map.size.y / 2.0)

	if map.splatmaps.is_empty():
		map.initialize_splatmaps(Globals.terrain_types.size())

	_ensure_splat_textures()
	_upload_splats_to_shader()
	_upload_terrain_textures()


func apply_base_layer(terrain: TerrainType):
	if not map:
		return
	base_layer = terrain

	var terrain_id = base_layer.id
	var splat_index = terrain_id / 4
	var channel = terrain_id % 4

	# Ensure splatmaps exist
	if map.splatmaps.is_empty():
		map.initialize_splatmaps(Globals.terrain_types.size())

	# Clear all splatmaps first
	for img in map.splatmaps:
		for x in range(map.size.x):
			for y in range(map.size.y):
				img.set_pixel(x, y, Color(0, 0, 0, 0))

	# Fill selected terrain channel = 1
	var base_img = map.splatmaps[splat_index]

	# TODO: might cause performance issues on large maps
	for x in range(map.size.x):
		for y in range(map.size.y):
			var c = Color(0, 0, 0, 0)

			match channel:
				0:
					c.r = 1.0
				1:
					c.g = 1.0
				2:
					c.b = 1.0
				3:
					c.a = 1.0

			base_img.set_pixel(x, y, c)

	for i in range(map.splatmaps.size()):
		splat_textures[i].update(map.splatmaps[i])
	_ensure_splat_textures()


func _ensure_splat_textures():
	# If textures don't exist yet, create them
	if splat_textures.size() != map.splatmaps.size():
		splat_textures.clear()

		for img in map.splatmaps:
			var tex := ImageTexture.create_from_image(img)
			splat_textures.append(tex)

		_upload_splats_to_shader()
		return

	# Otherwise just update existing textures
	for i in range(map.splatmaps.size()):
		splat_textures[i].update(map.splatmaps[i])


func _upload_splats_to_shader():
	var mat := $TerrainMesh.get_active_material(0) as ShaderMaterial
	if not mat:
		push_warning("TerrainMesh has no ShaderMaterial")
		return

	if splat_textures.is_empty():
		push_warning("No splat textures found")
		return

	mat.set_shader_parameter("splat_tex", splat_textures)
	mat.set_shader_parameter("splat_count", splat_textures.size())


func _upload_terrain_textures():
	var mat := $TerrainMesh.get_active_material(0) as ShaderMaterial
	if not mat:
		push_warning("No ShaderMaterial")
		return

	var terrains = Globals.terrain_types
	if terrains.is_empty():
		return

	var albedo_array: Array[Texture2D] = []
	var normal_array: Array[Texture2D] = []
	var rough_array: Array[Texture2D] = []
	var ao_array: Array[Texture2D] = []
	var height_array: Array[Texture2D] = []

	for i in range(MAX_TERRAINS):
		if i < terrains.size():
			var t = terrains[i]
			albedo_array.append(t.albedo)
			normal_array.append(t.normal_gl)
			rough_array.append(t.roughness)
			ao_array.append(t.ao)
			height_array.append(t.displacement)
		else:
			albedo_array.append(null)
			normal_array.append(null)
			rough_array.append(null)
			ao_array.append(null)
			height_array.append(null)

	mat.set_shader_parameter("albedo_tex", albedo_array)
	mat.set_shader_parameter("normal_tex", normal_array)
	mat.set_shader_parameter("roughness_tex", rough_array)
	mat.set_shader_parameter("ao_tex", ao_array)
	mat.set_shader_parameter("height_tex", height_array)

	mat.set_shader_parameter("terrain_count", terrains.size())

	# this makes the picture repeat itself so we don't have one big picture covering the entire map
	mat.set_shader_parameter("uv_scale", 16.0)


func rebuild_terrain_index_texture():
	var img = Image.create(map.size.x, map.size.y, false, Image.FORMAT_R8)

	for y in range(map.size.y):
		for x in range(map.size.x):
			var index = y * map.size.x + x
			var value = map.terrain_grid[index]
			img.set_pixel(x, y, Color(value / 255.0, 0, 0))


func apply_texture_brush(positions: Array[Vector2i]):
	if not map:
		return

	var modified_splats := {}

	for pos in positions:
		var px = pos.x
		var py = pos.y

		# Collect weights
		var flat := []

		for s in range(map.splatmaps.size()):
			var c = map.splatmaps[s].get_pixel(px, py)
			flat.append(c.r)
			flat.append(c.g)
			flat.append(c.b)
			flat.append(c.a)

		# Increase selected terrain
		var terrain_id = base_layer.id  # or pass active terrain
		var strength = 0.25

		flat[terrain_id] += strength

		# Clamp
		for i in range(flat.size()):
			flat[i] = clamp(flat[i], 0.0, 1.0)

		# Normalize
		var total := 0.0
		for v in flat:
			total += v

		if total > 0.0001:
			for i in range(flat.size()):
				flat[i] /= total

		# Write back
		var index := 0
		for s in range(map.splatmaps.size()):
			var img = map.splatmaps[s]

			var c = Color(flat[index], flat[index + 1], flat[index + 2], flat[index + 3])

			img.set_pixel(px, py, c)
			modified_splats[s] = true
			index += 4

	# Update textures ONCE per splat
	for s in modified_splats.keys():
		splat_textures[s].update(map.splatmaps[s])
