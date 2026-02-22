extends Resource

@export var terrain_types: Array[TerrainType]


func _ready():
	var i = 0
	for terrain in terrain_types:
		terrain.id = i
		i += 1
