extends ActiveBombElementAnimated
class_name Screw
@export var id = "left_top_screw"
@export var group = "cover"
@export var default_state = true

func clicked(item: String, bomb: Bomb):
	if item == "screwdriver":
		bomb.state.setProp(id, !bomb.state.getProp(id))
