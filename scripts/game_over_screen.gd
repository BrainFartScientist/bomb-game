extends CanvasLayer




func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level/level_01/level_01.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
