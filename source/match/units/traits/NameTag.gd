extends Node3D

@onready var _unit: Area3D = get_parent() as Area3D
@onready var _label: Label3D = find_child("Label3D")


func _ready():
	hide()
	if _unit == null:
		return
	_unit.mouse_entered.connect(_on_mouse_entered)
	_unit.mouse_exited.connect(_on_mouse_exited)


func _on_mouse_entered():
	var unit_name: String = _get_unit_name()
	if unit_name.is_empty():
		return
	_label.text = unit_name
	show()


func _get_unit_name() -> String:
	if _unit == null or not is_instance_valid(_unit):
		return ""
	var unit_name_value: Variant = _unit.get("unit_name")
	if unit_name_value == null:
		return ""
	return str(unit_name_value)


func _on_mouse_exited():
	hide()
