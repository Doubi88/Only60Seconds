extends KinematicBody2D

class_name Creature

var velocity = Vector2();

export var gravity = 20
export var jumpPower = 600

const FLOOR = Vector2(0, -1)

func _physics_process(delta: float) -> void:
	velocity.y += gravity
	velocity = move_and_slide(velocity, FLOOR)

func setVelocity(velocityX: float) -> void:
	self.velocity.x = velocityX

func jump():
	if (is_on_floor()):
		velocity.y -= jumpPower
