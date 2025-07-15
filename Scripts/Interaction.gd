extends Node2D


var nearInteractible = false
var detection

# If in an interactible state + pressing F do the interaction.
func _process(delta):
	if Input.is_action_just_pressed("Interact") and nearInteractible:
		interaction(detection)


# On entered area, add the detection. Will cause an issue if 2 area to close.
func _on_interaction_area_area_entered(area: Area2D) -> void:
	nearInteractible = true
	detection = area
	#print("in collision")

# Leaving the Area
func _on_interaction_area_area_exited(area: Area2D) -> void:
	nearInteractible = false
	#print("not in collision")
	


# Do an action depending on the interactible.
func interaction(area: Area2D) -> void:
	match area.myClassName:
		"door":
			area.loadNewScene()
