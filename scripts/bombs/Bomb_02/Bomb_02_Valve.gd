extends ActiveBombElementAnimated

@onready var screw_sound = $"../screwSound"
@onready var spray_sound = $"../spraySound"

func clicked(item: String, bomb: Bomb):
	if item == "screwdriver" and !bomb.state.getProp("ValveOpen"):
		bomb.state.setProp("ValveOpen", true)
		screw_sound.play()
	elif bomb.state.getProp("ValveOpen"):
		bomb.state.setProp("Refilled", true)
		spray_sound.play()
