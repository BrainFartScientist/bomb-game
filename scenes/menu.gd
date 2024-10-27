extends Control


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level_01/level_01.tscn")


func _on_play_more_pressed():
	get_tree().change_scene_to_file("res://scenes/level/level_02/level_02.tscn")
