extends Node

var timer: ReversibleTimer

func _init() -> void:
	timer = ReversibleTimer.new()
	timer.timeLeft = 60
