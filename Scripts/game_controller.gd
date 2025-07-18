class_name GameController extends Node


@export var world2D : Node2D
@export var gameUI : CanvasLayer
@export var Character : Node2D

var current_world2D
var current_gameUI
var current_Character
var topDown = true #Are we currently using the top down character?

func _ready() -> void:
	Global.game_controller = self
	change_gameUI_scene("res://Scenes/Levels/main_menu.tscn")

#Credit for this code: https://www.youtube.com/watch?v=32h8BR0FqdI&ab_channel=StayAtHomeDev
func change_gameUI_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_gameUI != null:
		if delete:
			current_gameUI.queue_free() # Removes the scenes.
		elif keep_running:
			current_gameUI.visible = false # Keeps the scene in memory and running.
		else:
			gameUI.remove_child(current_gameUI)  # Keeps the scene in memory but dead.
	var new = load(new_scene).instantiate()
	gameUI.add_child(new)
	current_gameUI = new


func change_world2D_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_world2D != null:
		if delete:
			current_world2D.queue_free() # Removes the scenes.
		elif keep_running:
			current_world2D.visible = false # Keeps the scene in memory and running.
		else:
			gameUI.remove_child(current_world2D)  # Keeps the scene in memory but dead.
	var new = load(new_scene).instantiate()
	world2D.add_child(new)
	current_world2D = new

func placing_player(coordinate: Vector2, changeControle: bool = false) -> void:
	var newCharacter
	if current_Character != null: # If the Character is non existant, append the default one (Top down).
		print("current_Character is not null")
		print(changeControle)
		print(topDown)
		if changeControle != topDown :        # If we want to change the control, put the opposite. If not keep the same as current.
			newCharacter =  load("res://Scenes/Characters state/character_Top_Down.tscn").instantiate()
			topDown = true #We are now in topDown mode.
		else:
			newCharacter = load("res://Scenes/Characters state/character_Side_Scroll.tscn").instantiate() 
			topDown = false #We are now in SideScroll mode.
		current_Character.queue_free() # Remove the current Character from the scene.
	else:
		print("current_Character is null")
		newCharacter = load("res://Scenes/Characters state/character_Top_Down.tscn").instantiate() #Default
	Character.add_child(newCharacter)
	current_Character = newCharacter
	current_Character.position = coordinate
