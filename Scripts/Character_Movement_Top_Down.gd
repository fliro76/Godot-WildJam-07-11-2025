extends CharacterBody2D

#@onready var all_interactions = []
#@onready var interactlabel = $"Interaction Components/Label"


const SPEED = 300.0
const JUMP_VELOCITY = 300

#func _ready() -> void:
	#update_interaction()

func _physics_process(_delta: float) -> void:




	var ydirection := Input.get_axis("Move_Up", "Move_Down")
	if ydirection:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

#Interaction Componenents################################################################

#	if Input.is_action_just_pressed("Interact"):
		#execute_interaction()



#func _on_interaction_area_area_entered(area: Area2D) -> void:
#	all_interactions.insert(0, area)
#	update_interaction()


#func _on_interaction_area_area_exited(area: Area2D) -> void:
#	all_interactions.erase(area)
#	update_interaction()


#func update_interaction() -> void:
	#if all_interactions:
		#interactlabel.text = all_interactions[0].interact_Label
		#print("weeee")
	#else:
		#interactlabel.text = ""
		#print("kaboom?")
#
#
#func execute_interaction():
	#if all_interactions:
		#var cur_interaction = all_interactions[0]
		#match cur_interaction.interact_type:
			#"Print_Test" : print(cur_interaction.YaY)
