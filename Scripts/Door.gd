class_name Door extends Area2D


#Propreties

var myClassName = "door":
	get:
		return myClassName

var labelname = "open door":
	get:
		return labelname

@export var levelToTeleport = "Scenes/Levels/Level/level_0" #Need to set manually for each door.
@export var coordinate: Vector2 = Vector2(0,0)
@export var changeControle: bool = true

#Function

#Load new scenes with the information set. To add coordinate.
func loadNewScene() -> void:
	Global.game_controller.change_world2D_scene(str("res://",levelToTeleport,".tscn")) 
	Global.game_controller.placing_player(coordinate, changeControle)
