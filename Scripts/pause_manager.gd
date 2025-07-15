extends CanvasLayer

var ispaused
	#Hides the menu and sets the ispaused var to false
func _ready() -> void:
	hide()
	print("Hide1")
	ispaused = false

func _physics_process(delta: float) -> void:
	#fetches resuming func and resumes the game
	if Input.is_action_just_pressed("Pause") and ispaused:
		resuming()
		#fetches pausing func and pauses the game
	elif (Input.is_action_just_pressed("Pause") and !ispaused):
		pausing ()

#sets game to "paused state" and shows the button
func pausing() -> void:
		get_tree().paused = true
		ispaused = true
		show()
		print("Show")
#sets game to "!paused state" and hides the button
func resuming() -> void:
		get_tree().paused = false
		ispaused = false
		hide()
		print("Hide2")

#fetches the resuming func when pressing the "Resume" button
func _on_pause_pressed() -> void:
	resuming()
