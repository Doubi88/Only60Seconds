extends Area2D

class_name Door

export var isOpen = false

func _process(delta: float) -> void:
	if (isOpen):
		$AnimatedSprite.frame = 1
	else:
		$AnimatedSprite.frame = 0

func use():
	isOpen = !isOpen


func _on_Area_body_entered(body: Node) -> void:
	print(body.name + " entered " + name)
	if (body.has_method("setUsable")):
		body.setUsable(self)

func _on_Area_body_exited(body: Node) -> void:
	print(body.name + " exited " + name)
	if (body.has_method("setUsable")):
		body.setUsable(null)
