extends ActiveBombElementAnimated
class_name Screw
@export var id = "left_top_screw"
@export var group = "cover"
@export var default_state = true

func clicked(item: GameState.Tools, bomb: Bomb):
	if item == GameState.Tools.Screwdriver:
		bomb.state.setProp(id, !bomb.state.getProp(id))
