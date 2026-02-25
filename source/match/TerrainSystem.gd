class_name TerrainSystem

extends Node3D

@export var base_layer: TerrainType = Globals.terrain_types.front()

var size: Vector2i
var map: MapResource
var splat_images: Array[Image] = []
var splat_textures: Array[Texture2D] = []


func set_map(_map: MapResource):
	print("set_map")
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

	_update_splat_textures()
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

	_update_splat_textures()
	_upload_splats_to_shader()
	_upload_terrain_textures()


func _update_splat_textures():
	splat_textures.clear()

	for img in map.splatmaps:
		var tex := ImageTexture.create_from_image(img)
		splat_textures.append(tex)


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
		push_warning("TerrainMesh has no ShaderMaterial")
		return

	var terrains = Globals.terrain_types
	if terrains.is_empty():
		push_warning("No terrain types found")
		return

	var albedo_array: Array[Texture2D] = []
	var normal_array: Array[Texture2D] = []
	var rough_array: Array[Texture2D] = []
	var ao_array: Array[Texture2D] = []
	var height_array: Array[Texture2D] = []

	for t in terrains:
		albedo_array.append(t.albedo)
		normal_array.append(t.normal_gl)
		rough_array.append(t.roughness)
		ao_array.append(t.ao)
		height_array.append(t.displacement)

	mat.set_shader_parameter("albedo_tex", albedo_array)
	mat.set_shader_parameter("normal_tex", normal_array)
	mat.set_shader_parameter("roughness_tex", rough_array)
	mat.set_shader_parameter("ao_tex", ao_array)
	mat.set_shader_parameter("height_tex", height_array)

	mat.set_shader_parameter("terrain_count", terrains.size())


func rebuild_terrain_index_texture():
	var img = Image.create(map.size.x, map.size.y, false, Image.FORMAT_R8)

	for y in range(map.size.y):
		for x in range(map.size.x):
			var index = y * map.size.x + x
			var value = map.terrain_grid[index]
			img.set_pixel(x, y, Color(value / 255.0, 0, 0))


func apply_terrain_brush_stroke(
	world_pos: Vector3, terrain_id: int, radius: float, strength: float
):
	var local = world_pos - $TerrainMesh.position
	var center_x = int(local.x)
	var center_y = int(local.z)

	for iy in range(-radius, radius):
		for ix in range(-radius, radius):
			var px = center_x + ix
			var py = center_y + iy

			if px < 0 or py < 0 or px >= map.size.x or py >= map.size.y:
				continue

			var dist = Vector2(ix, iy).length()
			if dist > radius:
				continue

			var falloff = 1.0 - (dist / radius)
			var add_weight = falloff * strength

			# Collect all terrain weights at this pixel
			var weights = []

			for s in range(map.splatmaps.size()):
				var img = map.splatmaps[s]
				var c = img.get_pixel(px, py)
				weights.append([c.r, c.g, c.b, c.a])

			# Flatten to 1D list
			var flat = []
			for w in weights:
				flat.append_array(w)

			# Increase selected terrain
			flat[terrain_id] += add_weight

			# Clamp
			for i in range(flat.size()):
				flat[i] = clamp(flat[i], 0.0, 1.0)

			# Normalize across ALL terrains
			var total = 0.0
			for v in flat:
				total += v

			if total > 0:
				for i in range(flat.size()):
					flat[i] /= total

			# Write back
			var index = 0
			for s in range(map.splatmaps.size()):
				var img = map.splatmaps[s]

				var c = Color(flat[index], flat[index + 1], flat[index + 2], flat[index + 3])

				img.set_pixel(px, py, c)

				splat_textures[s].update(img)

				index += 4


# Generates a splat map image for up to 4 terrain types using RGBA channels.
# Each channel (R, G, B, A) represents the weight of a terrain type at each pixel.
# terrains: Array of up to 4 TerrainType objects to encode in the splat map.
# Returns: An Image where each pixel's RGBA values represent the blend weights for the terrains.
func generate_splat_map(terrains: Array[TerrainType]) -> Image:
	var image = Image.new()
	image.create(size.x, size.y, false, Image.FORMAT_RGBA8)

	# Iterate over every pixel in the map
	for x in range(size.x):
		for y in range(size.y):
			var color = Color(0, 0, 0, 0)
			# Assign each terrain type to a channel if present
			if terrains.size() > 0:
				color.r = 1.0  # Full weight for terrain 0 (Red channel)
			if terrains.size() > 1:
				color.g = 0.0  # Weight for terrain 1 (Green channel)
			if terrains.size() > 2:
				color.b = 0.0  # Weight for terrain 2 (Blue channel)
			if terrains.size() > 3:
				color.a = 0.0  # Weight for terrain 3 (Alpha channel)
			image.set_pixel(x, y, color)

	return image


# Generates an array of splat map images, each encoding up to 4 terrain types.
# This is necessary if there are more than 4 terrain types,
# since each image can only encode 4 types (RGBA).
# terrains: Array of TerrainType objects to encode.
# Returns: Array of Images, each representing up to 4 terrain types.
func generate_splat_map_array(terrains: Array[TerrainType]) -> Array[Image]:
	var splat_map_array = []

	# Process terrains in groups of 4 (since RGBA = 4 channels)
	for i in range(0, terrains.size(), 4):
		var splat_map = generate_splat_map(terrains.slice(i, i + 4))
		splat_map_array.append(splat_map)
	return splat_map_array
