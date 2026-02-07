extends Node3D

class_name Attack

var target_unit = null

@onready var _unit = get_parent()

func _ready():
	assert(target_unit != null, "target unit was not provided")
