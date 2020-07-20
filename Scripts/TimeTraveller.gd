extends Creature

class_name TimeTraveller

export var travelSpeed = 1
export var timer: Resource

func _process(delta: float) -> void:
	if (Input.is_action_pressed("time_travel")):
		timer.reverse = true
	else:
		timer.reverse = false
