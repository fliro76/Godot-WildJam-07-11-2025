extends Control


@export var timerLabel : Label

var clock : Clock

func _ready() -> void:
	clock = get_tree().get_first_node_in_group("Timer")
	
func _process(delta: float) -> void:
	update_timer_label()



func update_timer_label():
	timerLabel.text = clock.time_to_string()
