extends ActiveBombElementAnimated

func clicked(item: String, bomb: Bomb):
	if item == "ducttape":
		bomb.state.setProp("CablesFixed", true)
