extends ActiveBombElementAnimated

func clicked(item: String, bomb: Bomb):
	bomb.state.setProp("CableFixed1", true)
