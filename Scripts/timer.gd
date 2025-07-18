extends Node
class_name Clock

var time = 100.0
var stopped = false

func _process(delta: float) -> void:
	if stopped :
		return
	time -= delta

func reset():
	time = 0.0

func time_to_string() -> String:
	var sec = fmod(time, 60)
	var min = time / 60
	# formating time to look like this : 00 : 00
	var format_string = "%02d : %02d"
	var actual_string = format_string % [min, sec]
	return actual_string
