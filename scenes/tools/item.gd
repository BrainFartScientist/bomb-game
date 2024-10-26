extends Node2D
class_name Item

@export var tool: String = "screwdriver"
@onready var sprite = $sprite
var has_outline: bool = false
const tools = {
	"screwdriver": {
		"image": preload("res://assets/graphics/generic_tools/genericItem_color_005.png")
	},
	"ducttape": {
		"image": preload("res://assets/graphics/custom_tools/duct_tape.png")
	}
}

func _ready() -> void:
	switch_tools(tool)
	
func switch_tools(tool: String):
	self.tool = tool
	sprite.texture = tools[tool].image
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.add_interactive_element(self)


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.remove_interactive_element(self)
		set_outline(false)
		
		
func set_outline(has_outline: bool):
	self.has_outline = has_outline
	sprite.material.set("shader_param/hasOutline", self.has_outline)
	
func interact(player: Node):
	if player.holdingTool != "":
		var temp = player.holdingTool
		player.holdingTool = tool
		switch_tools(temp)
	else:
		player.holdingTool = tool
		queue_free()
	pass
