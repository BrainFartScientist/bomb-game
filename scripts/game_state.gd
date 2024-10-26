extends Node

enum Tools {
	None,
	Screwdriver,
	Ducttape
}
var bomb_state = {}
var previous_scene = null
var tool: Tools = Tools.None

func get_bomb_state(id: String) -> BombState:
	if !bomb_state.has(id):
		return null
	return bomb_state[id]
	
func set_bomb_state(id: String, bomb_state: BombState):
	self.bomb_state[id] = bomb_state

func access_bomb(current_scene: String, bomb_scene: String):
	previous_scene = current_scene
	get_tree().change_scene_to_file(bomb_scene)
	
func leave_scene():
	if previous_scene != null:
		var temp = previous_scene
		previous_scene = null
		get_tree().change_scene_to_file(temp)
		
func set_tool(tool: Tools):
	self.tool = tool
	
func get_tool() -> Tools:
	return self.tool
	
