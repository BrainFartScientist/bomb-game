extends Button

@export var bomb: Bomb

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self.request_exit)

func request_exit():
	GameState.set_bomb_state(bomb.id, bomb.state)
	GameState.leave_scene()
	
