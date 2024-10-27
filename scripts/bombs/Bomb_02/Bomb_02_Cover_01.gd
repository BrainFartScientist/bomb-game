extends ActiveBombElementSprite

@onready var plate = $"../plateSound"

func clicked(item: String, bomb: Bomb):
	bomb.state.setProp("CoverOpen1", true)
	plate.play()
