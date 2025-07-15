extends Node2D


var nearInteractible = false
var detection


func _process(delta):
	if Input.is_action_just_pressed("Interact") and nearInteractible:
		interaction(detection)

func _on_interaction_area_area_entered(area: Area2D) -> void:
	nearInteractible = true
	detection = area
	#print("in collision")


func _on_interaction_area_area_exited(area: Area2D) -> void:
	nearInteractible = false
	#print("not in collision")
	
func interaction(area: Area2D) -> void:
	#print(area.name)
	match area.name:
		"Door":
			print("door type")
		"Object":
			print("Object type")
