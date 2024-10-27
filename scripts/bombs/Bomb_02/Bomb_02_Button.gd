extends ActiveBombElementAnimated

func clicked(item: String, bomb: Bomb):
	if bomb.state.getProp("CableFixed2"):
		bomb.state.setProp("CoverOpen2", !bomb.state.getProp("CoverOpen2"))
