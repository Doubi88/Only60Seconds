extends Label

class_name TimerLabel

export var timer: Resource

func _process(delta: float) -> void:
	timer.timeTick(delta)
	text = "%02d" % [timer.timeLeft]
