extends Node2D
class_name Item

@export var tool: String = "screwdriver"
@onready var sprite = $sprite
var has_outline: bool = false
var active_tool = null
const tools = {
	"screwdriver": {
		"image": preload("res://assets/graphics/generic_tools/genericItem_color_005.png")
	},
	"ducttape": {
		"image": preload("res://assets/graphics/custom_tools/duct_tape.png")
	}
}

func _ready() -> void:
	active_tool = get_node("screwdriver")
	switch_tools(tool)
	
func switch_tools(tool: String):
	active_tool.visible = false
	self.tool = tool
	active_tool = get_node(self.tool)
	active_tool.visible = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.add_interactive_element(self)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.remove_interactive_element(self)
		set_outline(false)
		
		
func set_outline(has_outline: bool):
	self.has_outline = has_outline
	active_tool.material.set("shader_param/hasOutline", self.has_outline)
	
func interact(player: Node):
	if player.holdingTool != "":
		var temp = player.holdingTool
		player.set_holding_tool(tool)
		switch_tools(temp)
	else:
		player.set_holding_tool(tool)
		queue_free()
	pass
