## Simple orbit camera for test scenes.
## Controls:
##   Right mouse drag   – orbit (yaw + pitch)
##   Scroll wheel       – zoom in / out
##   Middle mouse drag  – pan
extends Camera3D

@export var target: Vector3 = Vector3.ZERO
@export var distance: float = 20.0
@export var orbit_speed: float = 0.005   # rad/px
@export var zoom_speed: float = 1.5
@export var pan_speed: float = 0.02

var _yaw: float = 0.0
var _pitch: float = -30.0  # degrees, negative = looking down

var _right_dragging: bool = false
var _middle_dragging: bool = false
var _last_mouse: Vector2 = Vector2.ZERO


func _ready() -> void:
	_apply_transform()


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			_right_dragging = event.pressed
			_last_mouse = event.position
		elif event.button_index == MOUSE_BUTTON_MIDDLE:
			_middle_dragging = event.pressed
			_last_mouse = event.position
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_UP:
			distance = max(1.0, distance - zoom_speed)
			_apply_transform()
		elif event.pressed and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			distance += zoom_speed
			_apply_transform()

	elif event is InputEventMouseMotion:
		var delta: Vector2 = event.position - _last_mouse
		_last_mouse = event.position

		if _right_dragging:
			_yaw -= delta.x * rad_to_deg(orbit_speed)
			_pitch = clamp(_pitch - delta.y * rad_to_deg(orbit_speed), -89.0, -5.0)
			_apply_transform()

		elif _middle_dragging:
			var right_vec := global_transform.basis.x * (-delta.x * pan_speed * distance / 15.0)
			var up_vec := global_transform.basis.y * (delta.y * pan_speed * distance / 15.0)
			target += right_vec + up_vec
			_apply_transform()


func _apply_transform() -> void:
	var yaw_rad := deg_to_rad(_yaw)
	var pitch_rad := deg_to_rad(_pitch)
	var offset := Vector3(
		distance * cos(pitch_rad) * sin(yaw_rad),
		distance * sin(pitch_rad),
		distance * cos(pitch_rad) * cos(yaw_rad)
	)
	global_position = target - offset
	look_at(target, Vector3.UP)
