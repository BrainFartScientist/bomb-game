extends TextureRect

const tool_icons = {
	"": preload("res://assets/graphics/generic_tools/genericItem_color_086.png"),
	"screwdriver": preload("res://assets/graphics/generic_tools/genericItem_color_005.png"),
	"ducttape": preload("res://assets/graphics/custom_tools/duct_tape.png"),
	"hammer": preload("res://assets/graphics/generic_tools/genericItem_color_010.png"),
}

func display_tool(tool: String):
	texture = tool_icons[tool]
	pass
	
func get_tool_icons(tool : String):
	return tool_icons[tool]
