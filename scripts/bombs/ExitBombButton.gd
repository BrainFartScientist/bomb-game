extends Button

@export var bomb: Bomb

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(self.request_exit)

func request_exit():
	get_tree().root.get_child(0).leave_bomb()
	pass
	#GameState.set_bomb_state(bomb.id, bomb.state)
	#GameState.leave_scene()
	
