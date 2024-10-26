extends Node
class_name GameState

enum Tools {
	None,
	Screwdriver,
	Ducttape
}
var bomb_state = {}
var previous_scene = null
var tool: Tools = Tools.None
var bombs = {}
var open_bomb_id = null
@export var level: Node = null

func _ready() -> void:
	for child in get_children():
		if child is Bomb:
			bombs[child.name] = child
	
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
	
func open_bomb(id: String):
	open_bomb_id = id
	level.visible = false
	bombs[id].visible = true
	bombs[id].is_open = true
	bombs[id].get_node("Camera").make_current()
	pass
	
func leave_bomb():
	bombs[open_bomb_id].visible = false
	bombs[open_bomb_id].is_open = false
	open_bomb_id = null
	level.visible = true
	level.get_node("Player/Camera2D").make_current()
	
