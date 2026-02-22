class_name TerrainSystem

extends Node3D

@export var base_layer: TerrainType:
	set(value):
		base_layer = value
		_apply_base_layer()

var size: Vector2i
var map: MapResource
var control_image: Image
var control_texture: ImageTexture


func set_map(_map: MapResource):
	map = _map

	# Create control texture / splat map
	control_image = Image.create(map.size.x, map.size.y, false, Image.FORMAT_RGBA8)
	control_image.fill(Color(1, 0, 0, 0))  # Base layer = Red

	control_texture = ImageTexture.create_from_image(control_image)

	var mat := $TerrainMesh.material_override as ShaderMaterial
	mat.set_shader_parameter("control_tex", control_texture)

	if not $TerrainMesh.mesh:
		var plane := PlaneMesh.new()
		plane.size = _map.size
		$TerrainMesh.mesh = plane

		# we need to properly set the position of the created mesh
		$TerrainMesh.position = Vector3(map.size.x / 2.0, 0, map.size.y / 2.0)

	if not $WaterMesh.mesh:
		var plane := PlaneMesh.new()
		plane.size = _map.size
		$WaterMesh.mesh = plane

		# we need to properly set the position of the created mesh
		$WaterMesh.position = Vector3(map.size.x / 2.0, 0, map.size.y / 2.0)


func _apply_base_layer():
	if not base_layer:
		base_layer = TerrainLibrary.terrain_types.front()

	var mat := $TerrainMesh.material_override as ShaderMaterial
	if not mat:
		push_warning("TerrainMesh has no ShaderMaterial")
		return
	if base_layer.ao:
		mat.set_shader_parameter("ambient_occlusion_tex", base_layer.ao)
	if base_layer.albedo:
		mat.set_shader_parameter("albedo_tex", base_layer.albedo)
	if base_layer.normal_dx:
		mat.set_shader_parameter("normal_dx_tex", base_layer.normal_dx)
	if base_layer.normal_gl:
		mat.set_shader_parameter("normal_gl_tex", base_layer.normal_gl)
	if base_layer.displacement:
		mat.set_shader_parameter("height_tex", base_layer.displacement)
	if base_layer.roughness:
		mat.set_shader_parameter("roughness_tex", base_layer.roughness)

	mat.set_shader_parameter("uv_scale", 10.0)
	mat.set_shader_parameter("use_dx_normal", false)
	mat.set_shader_parameter("height_strength", 0.0)  # start flat


func apply_terrain_brush_stroke(
	world_pos: Vector3, layer_index: int, radius: float, strength: float
):
	var local = world_pos - $TerrainMesh.position
	var x = int(local.x)
	var y = int(local.z)

	for iy in range(-radius, radius):
		for ix in range(-radius, radius):
			var px = x + ix
			var py = y + iy

			if px < 0 or py < 0 or px >= map.size.x or py >= map.size.y:
				continue

			var dist = Vector2(ix, iy).length()
			if dist > radius:
				continue

			var falloff = 1.0 - (dist / radius)

			var color = control_image.get_pixel(px, py)

			color[layer_index] += falloff * strength
			# color = color.clamp(0.0, 1.0)

			# normalize so total = 1
			var total = color.r + color.g + color.b + color.a
			if total > 0:
				color /= total

			control_image.set_pixel(px, py, color)

	control_texture.update(control_image)


func rebuild_terrain_index_texture():
	var img = Image.create(map.size.x, map.size.y, false, Image.FORMAT_R8)

	for y in range(map.size.y):
		for x in range(map.size.x):
			var index = y * map.size.x + x
			var value = map.terrain_grid[index]
			img.set_pixel(x, y, Color(value / 255.0, 0, 0))
