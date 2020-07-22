extends Label

class_name TimerLabel

signal timeout

func _process(delta: float) -> void:
	GlobalVars.timer.timeTick(delta)
	text = "%02d" % [GlobalVars.timer.timeLeft]
	if (GlobalVars.timer.timeLeft <= 0):
		emit_signal("timeout")
