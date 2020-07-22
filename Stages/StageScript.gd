extends Node2D

class_name StageScript

export(String, FILE, "*.tscn") var nextScene

func _on_QuitGameArea_body_entered(body: Node) -> void:
	if (body == $Player):
		print("Entered quit")
		get_tree().quit()


func _on_NextStageArea_body_entered(body: Node) -> void:
	if (body == $Player):
		get_tree().change_scene(nextScene)

func _on_StartCreditsArea_body_entered(body: Node) -> void:
	if (body == $Player):
		get_tree().change_scene("res://Stages/Credits.tscn")


func _on_TimerLabel_timeout() -> void:
	GlobalVars.timer.timeLeft = 60
	get_tree().change_scene("res://Stages/GameOver.tscn")


func _on_DeathArea_body_entered(body: Node) -> void:
	get_tree().reload_current_scene()


func _on_RetryButton_pressed() -> void:
	get_tree().change_scene("res://Stages/StartStage.tscn")
