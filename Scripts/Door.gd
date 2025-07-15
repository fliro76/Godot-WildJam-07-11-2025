class_name Door extends Area2D

#Propreties
@onready var soulsCounterNode = get_node("SoulsCounter")


var soulsCount = 0

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
	#add count on door triggered
	soulsCounterNode.set_soulsCounter(soulsCount)
	
	get_tree().change_scene_to_file(str("res://",levelToTeleport,".tscn"))
