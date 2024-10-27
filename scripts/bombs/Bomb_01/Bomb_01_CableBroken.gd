extends ActiveBombElementAnimated

@onready var cableSound = $"../cableSound"
@onready var deniedSound = $"../deniedSound"

func clicked(item: String, bomb: Bomb):
	if item == "ducttape":
		bomb.state.setProp("CablesFixed", true)
		cableSound.play()
	else:
		deniedSound.play()
