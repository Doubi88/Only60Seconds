extends TimedObject

class_name Door

export var isOpen = false setget setIsOpenWithoutSaving
export var openOnSwitch = true

func _process(delta: float) -> void:
	if (isOpen):
		$AnimatedSprite.frame = 1
	else:
		$AnimatedSprite.frame = 0
		
	if (GlobalVars.timer.reverse):
		var action = getAction(round(GlobalVars.timer.timeLeft))
		if (action == "open"):
			setIsOpenWithoutSaving(false)
		elif (action == "close"):
			setIsOpenWithoutSaving(true)
func toggleIsOpen():
	setIsOpenWithoutSaving(!isOpen)
	if (isOpen):
		saveAction(round(GlobalVars.timer.timeLeft), "open")
	else:
		saveAction(round(GlobalVars.timer.timeLeft), "close")

func setIsOpenWithoutSaving(value: bool):
	isOpen = value
	$CollisionShape2D.disabled = isOpen


func _on_Switch_switched(isOn) -> void:
	if (openOnSwitch):
		setIsOpenWithoutSaving(isOn)
	else:
		setIsOpenWithoutSaving(!isOn)
