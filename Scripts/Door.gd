class_name Door extends Area2D


#Propreties

var myClassName = "door":
	get:
		return myClassName

var labelname = "open door":
	get:
		return labelname

@export var levelToTeleport = "Scenes/Levels/Level/level_0" #Need to set manually for each door.


#Function

#Load new scenes with the information set. To add coordinate.
func loadNewScene() -> void:
	get_tree().change_scene_to_file(str("res://",levelToTeleport,".tscn"))
