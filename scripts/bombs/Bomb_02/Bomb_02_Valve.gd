extends ActiveBombElementAnimated


func clicked(item: String, bomb: Bomb):
	if item == "screwdriver" and !bomb.state.getProp("ValveOpen"):
		bomb.state.setProp("ValveOpen", true)
	elif bomb.state.getProp("ValveOpen"):
		bomb.state.setProp("Refilled", true)
