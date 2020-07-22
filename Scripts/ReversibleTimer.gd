
class_name ReversibleTimer

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
		if (timeLeft > 0):
			timeLeft -= delta
	
