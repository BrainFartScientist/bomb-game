extends ActiveBombElementSprite

@onready var plateSound = $"../plateSound"

func clicked(item: String, bomb: Bomb):
	bomb.state.setProp("CoverOpen", true)
	plateSound.play()
