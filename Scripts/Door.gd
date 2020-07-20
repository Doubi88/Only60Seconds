extends TimedObject

class_name Door

export var isOpen = false
export var timer: Resource

func _process(delta: float) -> void:
	if (isOpen):
		$AnimatedSprite.frame = 1
	else:
		$AnimatedSprite.frame = 0
		
	if (timer.reverse):
		var action = getAction(round(timer.timeLeft))
		if (action == "open"):
			isOpen = false
		elif (action == "close"):
			isOpen = true

func use():
	isOpen = !isOpen
	if (isOpen):
		saveAction(round(timer.timeLeft), "open")
	else:
		saveAction(round(timer.timeLeft), "close")


func _on_Area_body_entered(body: Node) -> void:
	print(body.name + " entered " + name)
	if (body.has_method("setUsable")):
		body.setUsable(self)

func _on_Area_body_exited(body: Node) -> void:
	print(body.name + " exited " + name)
	if (body.has_method("setUsable")):
		body.setUsable(null)
