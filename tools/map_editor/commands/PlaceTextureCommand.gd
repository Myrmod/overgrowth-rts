class_name PlaceTextureCommand
extends EditorCommand

var map_resource: MapResource
var positions: Array[Vector2i]
var terrain_id: int
var strength: float = 0.5

var previous_weights := []


func _init(map_res, _positions, texture: TerrainType, _rotation):
	map_resource = map_res
	positions = _positions
	terrain_id = texture.id


func execute():
	previous_weights.clear()

	var splat_index = terrain_id / 4
	var channel = terrain_id % 4

	for pos in positions:
		var px = pos.x
		var py = pos.y

		var backup := []

		# Store old values
		for s in range(map_resource.splatmaps.size()):
			var pixel = map_resource.splatmaps[s].get_pixel(px, py)
			backup.append(pixel)

		previous_weights.append(backup)

		# Apply brush weight
		var img = map_resource.splatmaps[splat_index]
		var col = img.get_pixel(px, py)

		match channel:
			0:
				col.r += strength
			1:
				col.g += strength
			2:
				col.b += strength
			3:
				col.a += strength

		img.set_pixel(px, py, col)

		_normalize_pixel(px, py)


func _normalize_pixel(px: int, py: int):
	var flat := []

	for s in range(map_resource.splatmaps.size()):
		var c = map_resource.splatmaps[s].get_pixel(px, py)
		flat.append(c.r)
		flat.append(c.g)
		flat.append(c.b)
		flat.append(c.a)

	var total := 0.0
	for v in flat:
		total += v

	if total <= 0.0001:
		return

	for i in range(flat.size()):
		flat[i] /= total

	# Write back
	var index := 0
	for s in range(map_resource.splatmaps.size()):
		var c = Color(flat[index], flat[index + 1], flat[index + 2], flat[index + 3])

		map_resource.splatmaps[s].set_pixel(px, py, c)
		index += 4


func undo():
	for i in range(positions.size()):
		var pos = positions[i]
		var backup = previous_weights[i]

		for s in range(map_resource.splatmaps.size()):
			map_resource.splatmaps[s].set_pixel(pos.x, pos.y, backup[s])
