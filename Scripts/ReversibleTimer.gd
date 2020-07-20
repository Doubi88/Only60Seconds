extends Resource

class_name ReversibleTimer

signal timeout

export var maxTime = 60
export var timeLeft = 0.0
var reverse = false setget setReverse
	
func setReverse(value: bool):
	reverse = value
	
func timeTick(delta: float) -> void:
	if (reverse):
		if (timeLeft < maxTime):
			timeLeft += delta
	else:
		timeLeft -= delta
	
	if (timeLeft <= 0):
		emit_signal("timeout")
	
