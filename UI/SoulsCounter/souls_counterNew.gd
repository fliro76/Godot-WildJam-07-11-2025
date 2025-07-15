extends Node2D
@onready var label: Label = $MarginContainer/VBoxContainer/HBoxContainer/Label

var soulsCounter = 0 

func set_soulsCounter(soulsCounter: int) -> void:
	
		soulsCounter  = soulsCounter + 1 
		label.text = str(soulsCounter)
		
		
