extends Button


#Load the Level_0 scene
func _on_pressed() -> void:
	Global.game_controller.change_world2D_scene("res://Scenes/Levels/Level/Houses/level_1.tscn")
	Global.game_controller.change_gameUI_scene("res://Scenes/Miscelanious/UI/pause_manager.tscn")
	Global.game_controller.placing_player(Vector2(1000, 500))
	#get_tree().change_scene_to_file("res://Scenes/Levels/Level/Houses/level_1.tscn")
