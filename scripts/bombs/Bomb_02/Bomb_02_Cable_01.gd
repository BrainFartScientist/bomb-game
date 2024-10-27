extends ActiveBombElementAnimated
@onready var cable_sound = $"../cableSound"

func clicked(item: String, bomb: Bomb):
	bomb.state.setProp("CableFixed1", true)
	cable_sound.play()
