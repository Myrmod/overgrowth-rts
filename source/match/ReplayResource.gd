extends Resource

class_name ReplayResource

@export var version: int = 1
@export var tick_rate: int = 10
@export var commands: Array = []
@export var map: String
@export var settings: MatchSettings
@export var players_data: Array = []  # Serializable player data (dicts with color, controller, spawn_index_offset)
# @export var seed: int = 0 # might be needed for some random maps later
@export var final_time: int = 0  # Last time when the game ended, this can happen without a tick in case of defeat
@export var final_state: String = ""  # "victory", "defeat", or "aborted"
@export var statistics: Dictionary = {}  # game statistics
