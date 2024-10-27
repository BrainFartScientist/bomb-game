extends Button

@export var bomb: Bomb

func _ready() -> void:
	pressed.connect(self.request_exit)

func request_exit():
	get_tree().root.get_child(0).leave_bomb()
	pass
	
