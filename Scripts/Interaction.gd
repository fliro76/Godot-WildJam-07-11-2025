extends Node2D
#variable to set up mylabel in func ready
var mylabel 
var nearInteractible = false
var detection
func _ready () -> void:
	#sets mylabel to modify the text of label in further functions
	mylabel = $Label
	labelhidden()
	print("hidelabel")
# If in an interactible state + pressing F do the interaction.
func _process(delta):
	if Input.is_action_just_pressed("Interact") and nearInteractible:
		interaction(detection)


# On entered area, add the detection. Will cause an issue if 2 area to close.
func _on_interaction_area_area_entered(area: Area2D) -> void:
	nearInteractible = true
	detection = area
	#Shows the label =
	labelshown(area)
	#print("in collision

# Leaving the Area
func _on_interaction_area_area_exited(area: Area2D) -> void:
	nearInteractible = false
	labelhidden()
	#print("not in collision")
	


# Do an action depending on the interactible.
func interaction(area: Area2D) -> void:
	match area.myClassName:
		"door":
			area.loadNewScene()
#Shows the text label and connect to the area
func labelshown(area: Area2D) -> void:
	get_node("Label")
	#modified the label's text with the mylabel var set above, example can be found in the door.gd
	mylabel.text = area.labelname
	show()
#Hides the text label
func labelhidden() -> void:
	get_node("Label")
	hide()
