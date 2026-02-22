class_name TerrainSystem

extends Node3D

@export var base_layer: TerrainType:
	set(value):
		base_layer = value
		_apply_base_layer()

var size: Vector2i
var map: MapResource


func set_map(_map: MapResource):
	map = _map
	if not $TerrainMesh.mesh:
		var plane := PlaneMesh.new()
		plane.size = _map.size
		$TerrainMesh.mesh = plane

		# we need to properly set the position of the created mesh
		$TerrainMesh.position = Vector3(map.size.x / 2.0, 0, map.size.y / 2.0)


func _apply_base_layer():
	print("Material override:", $TerrainMesh.material_override)
	print("Mesh material:", $TerrainMesh.mesh.surface_get_material(0))
	print("_on_palette_texture_selected_as_base_layer: ", base_layer.name)
	if not base_layer:
		return

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

	print(mat)
