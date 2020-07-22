extends TimedObject

class_name Switch

signal switched(isOn)

export var isOn = false

func _process(delta: float) -> void:
	if (isOn):
		$AnimatedSprite.frame = 1
	else:
		$AnimatedSprite.frame = 0
		
	if (GlobalVars.timer.reverse):
		var action = getAction(round(GlobalVars.timer.timeLeft))
		if (action == "open"):
			isOn = false
			emit_signal("switched", isOn)
		elif (action == "close"):
			isOn = true
			emit_signal("switched", isOn)

func use():
	isOn = !isOn
	if (isOn):
		saveAction(round(GlobalVars.timer.timeLeft), "open")
	else:
		saveAction(round(GlobalVars.timer.timeLeft), "close")
		
	emit_signal("switched", isOn)



func _on_Switch_body_entered(body: Node) -> void:
	if (body.has_method("setUsable")):
		body.setUsable(self)


func _on_Switch_body_exited(body: Node) -> void:
	if (body.has_method("setUsable")):
		body.setUsable(null)
