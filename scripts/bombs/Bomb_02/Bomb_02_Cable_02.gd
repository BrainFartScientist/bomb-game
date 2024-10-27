extends ActiveBombElementAnimated

func clicked(item: String, bomb: Bomb):
	bomb.state.setProp("CableFixed2", true)
