extends TimeTraveller

class_name Player

export var moveSpeed = 500
var touchingUsable: Area2D = null

func _process(delta: float) -> void:
	var velocity = 0.0
	if (Input.is_action_pressed("move_left")):
		velocity -= moveSpeed
		
	if (Input.is_action_pressed("move_right")):
		velocity += moveSpeed
	
	if (Input.is_action_pressed("jump")):
		jump()
		
	if (Input.is_action_just_pressed("use")):
		if (touchingUsable != null && touchingUsable.has_method("use")):
			touchingUsable.use()
		
	setVelocity(velocity)

func setUsable(usable):
	if (usable == null || usable.has_method("use")):
		touchingUsable = usable
