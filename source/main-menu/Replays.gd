extends Control

@onready var replay_list = $ReplayList

func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://source/main-menu/Main.tscn")
