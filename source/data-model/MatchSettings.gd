extends Resource

class_name MatchSettings

enum Visibility {PER_PLAYER, ALL_PLAYERS, FULL}

@export var players: Array[PlayerSettings] = []
@export var visibility = Visibility.PER_PLAYER
@export var visible_player = 0
