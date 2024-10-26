extends Node
class_name BombState

var state = {}

func setProp(key: String, value: Variant):
	state[key] = value

func getProp(key: String) -> Variant:
	return state[key]
