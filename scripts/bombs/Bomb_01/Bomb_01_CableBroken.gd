extends ActiveBombElementAnimated

func clicked(item: GameState.Tools, bomb: Bomb):
	if item == GameState.Tools.Ducttape:
		bomb.state.setProp("CablesFixed", true)
