class_name ResourceGatherer extends Unit

signal auto_harvest_changed(enabled: bool)

const _AUTO_HARVEST_SCAN_RADIUS: float = 12.0
const _AUTO_HARVEST_SCAN_TICK_INTERVAL: int = 8

const CollectingResourcesSequentially = preload(
	"res://source/match/units/actions/CollectingResourcesSequentially.gd"
)

var auto_harvest_enabled: bool = false:
	set(value):
		if auto_harvest_enabled == value:
			return
		auto_harvest_enabled = value
		auto_harvest_changed.emit(value)

var _auto_harvest_tick_counter: int = 0


func _ready() -> void:
	super()
	MatchSignals.tick_advanced.connect(_on_auto_harvest_tick)


func _on_auto_harvest_tick() -> void:
	if not auto_harvest_enabled:
		return
	if not is_inside_tree():
		return
	if action != null:
		return
	_auto_harvest_tick_counter += 1
	if _auto_harvest_tick_counter < _AUTO_HARVEST_SCAN_TICK_INTERVAL:
		return
	_auto_harvest_tick_counter = 0
	var nearest: ResourceUnit = _find_nearest_resource()
	if nearest == null:
		return
	if not CollectingResourcesSequentially.is_applicable(self, nearest):
		return
	action = CollectingResourcesSequentially.new(nearest)


func _find_nearest_resource() -> ResourceUnit:
	var best: ResourceUnit = null
	var best_dist: float = _AUTO_HARVEST_SCAN_RADIUS * _AUTO_HARVEST_SCAN_RADIUS
	for r in get_tree().get_nodes_in_group("resource_units"):
		if not (r is ResourceUnit):
			continue
		if not is_instance_valid(r):
			continue
		var d: float = r.global_position.distance_squared_to(global_position)
		if d < best_dist:
			best_dist = d
			best = r
	return best
