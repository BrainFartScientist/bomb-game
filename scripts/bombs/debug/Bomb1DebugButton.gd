extends Button

@export var tool: GameState.Tools = GameState.Tools.None
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self.access_bomb1)

func access_bomb1():
	GameState.set_tool(tool)
	GameState.access_bomb("res://scenes/test/BombAccess.tscn", "res://scenes/bomb.tscn")
