extends Node2D
class_name BombDisplay

@onready var display = $NumberDisplay

func set_number(new_number: int):
	display.text = str(new_number)

func remove_number():
	display.text = ""
