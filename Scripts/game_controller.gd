class_name GameController extends Node


@export var world2D : Node2D
@export var gameUI : CanvasLayer

var current_world2D
var current_gameUI


func _ready() -> void:
	Global.game_controller = self 
	print("ready")
	change_gameUI_scene("res://Scenes/Levels/main_menu.tscn")

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
	print("loading new UI")


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
