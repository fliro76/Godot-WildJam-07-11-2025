extends Area2D

@export var levelToTeleport = "Scenes/Levels/Level/level_0"




# To change to the interaction.
func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file(str("res://",levelToTeleport,".tscn"))
