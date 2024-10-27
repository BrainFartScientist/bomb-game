extends Node2D

const tool_icons = {
	"": preload("res://assets/graphics/generic_tools/genericItem_color_086.png"),
	"screwdriver": preload("res://assets/graphics/generic_tools/genericItem_color_005.png"),
	"ducttape": preload("res://assets/graphics/custom_tools/duct_tape.png"),
	"hammer": preload("res://assets/graphics/generic_tools/genericItem_color_010.png"),
}
signal doAction(action : String, active : bool)
var texture : String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = get_parent().global_position

func _changeTool(tool : String):
	texture = tool_icons[tool]
	$Sprite2D.texture = texture
	
