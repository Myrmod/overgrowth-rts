extends Resource

class_name ReplayResource

@export var version: int = 1
@export var tick_rate: int = 10
@export var commands: Array = []
@export var map: String
@export var settings: MatchSettings
@export var players_data: Array = []  # Serializable player data (dicts with color, controller, spawn_index_offset)
@export var seed: int = 0
