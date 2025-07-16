extends Button


#Load the Level_0 scene
func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level/Houses/level_1.tscn")
