extends Node2D

class_name TimedObject

var actions = {}

func saveAction(second: int, action):
	actions[second] = action

func getAction(second: int):
	if (actions.has(second)):
		var action = actions[second]
		actions.erase(second)
		return action
	else:
		return null
