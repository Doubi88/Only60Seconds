extends Creature

class_name TimeTraveller

export var travelSpeed = 1

func _process(delta: float) -> void:
	if (Input.is_action_pressed("time_travel")):
		GlobalVars.timer.reverse = true
		if (get_node("ColorInverterRect") != null):
			get_node("ColorInverterRect").show()
	else:
		GlobalVars.timer.reverse = false
		if (get_node("ColorInverterRect") != null):
			get_node("ColorInverterRect").hide()
