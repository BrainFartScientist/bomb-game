extends ActiveBombElementSprite

func clicked(item: GameState.Tools, bomb: Bomb):
	bomb.state.setProp("CoverOpen", true)
