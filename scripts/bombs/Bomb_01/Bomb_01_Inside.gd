extends ActiveBombElementSprite

func clicked(item: String, bomb: Bomb):
	bomb.state.setProp("CoverOpen", false)
