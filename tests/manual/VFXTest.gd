extends Node3D

# Each entry: { name, root, anim_player, play_anim, length }
var _effects: Array = []


func _enter_tree() -> void:
	# Stop autoplay animations on the bundled prefabs (e.g. Fire's AnimationPlayer
	# has autoplay = "Init" which would play sound before _ready runs).
	for ap in [$Fire/AnimationPlayer, $FireExplosion/AnimationPlayer]:
		(ap as AnimationPlayer).autoplay = ""
		(ap as AnimationPlayer).stop()


func _ready() -> void:
	_effects = [
		_make_effect("Fire", $Fire, $Fire/AnimationPlayer, "Init"),
		_make_effect("FireExplosion", $FireExplosion, $FireExplosion/AnimationPlayer, "Init"),
	]

	# Start hidden by default.
	for effect: Dictionary in _effects:
		_set_active(effect, false)

	# Wire up UI.
	(%FirePlayOnce as Button).pressed.connect(_play_once.bind(_effects[0]))
	(%FireContinuous as CheckBox).toggled.connect(_set_continuous.bind(_effects[0]))
	(%FireExplosionPlayOnce as Button).pressed.connect(_play_once.bind(_effects[1]))
	(%FireExplosionContinuous as CheckBox).toggled.connect(_set_continuous.bind(_effects[1]))

	# Apply default checkbox states from the scene.
	_set_continuous((%FireContinuous as CheckBox).button_pressed, _effects[0])
	_set_continuous((%FireExplosionContinuous as CheckBox).button_pressed, _effects[1])


func _make_effect(name: String, root: Node3D, ap: AnimationPlayer, anim_name: String) -> Dictionary:
	var anim := ap.get_animation(anim_name)
	return {
		"name": name,
		"root": root,
		"anim_player": ap,
		"play_anim": anim_name,
		"length": anim.length if anim != null else 1.0,
		"continuous": false,
		"play_token": 0,
	}


# ------------------------------------------------------------------
# Effect control
# ------------------------------------------------------------------


func _play_once(effect: Dictionary) -> void:
	if effect.continuous:
		return
	# Bump token so any in-flight stop callbacks for previous presses are cancelled.
	effect.play_token = effect.play_token + 1
	var token: int = effect.play_token
	_set_active(effect, true)
	get_tree().create_timer(effect.length).timeout.connect(
		func() -> void:
			# Only stop if no newer play started and continuous wasn't enabled.
			if effect.play_token == token and not effect.continuous:
				_set_active(effect, false)
	)


func _set_continuous(enabled: bool, effect: Dictionary) -> void:
	effect.continuous = enabled
	effect.play_token = effect.play_token + 1  # cancel any pending one-shot timer
	_set_active(effect, enabled)


func _set_active(effect: Dictionary, active: bool) -> void:
	var root := effect.root as Node3D
	root.visible = active
	# Toggle every GPUParticles3D under the root so emission actually starts/stops.
	for particles in _find_particles(root):
		particles.emitting = active
		if active:
			particles.restart()
	# Run/stop the AnimationPlayer (handles light flicker / sound).
	var ap := effect.anim_player as AnimationPlayer
	if active:
		ap.stop()
		ap.play(effect.play_anim)
	else:
		ap.stop()


func _find_particles(node: Node) -> Array[GPUParticles3D]:
	var out: Array[GPUParticles3D] = []
	if node is GPUParticles3D:
		out.append(node)
	for child in node.get_children():
		out.append_array(_find_particles(child))
	return out
