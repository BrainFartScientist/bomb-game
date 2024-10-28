extends ActiveBombElementSprite

@export var number = 1

func _ready() -> void:
	self.get_node("Label").text = str(number)

func clicked(item: String, bomb: Bomb):
	var numbers = bomb.state.getProp("numbers")
	numbers.append(self.number)
	bomb.state.setProp("numbers", numbers)
