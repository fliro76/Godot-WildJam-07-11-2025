extends CharacterBody2D

@onready var Player2D: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -250.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_Left", "Move_Right")
	
	#Facing
	if direction > 0:
		Player2D.flip_h = false
	elif direction < 0:
		Player2D.flip_h = true
	#Animation
	if is_on_floor():
		if direction == 0:
			Player2D.play("Idle")
		else:
			Player2D.play("Running")
	else:
		Player2D.play("Jump")

	#Mouvement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
