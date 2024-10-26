extends Node2D
class_name Bomb

@export var id = ""

var state = BombState.new()
var screws = {}
var tool: String = ""

var is_open = false

const tool_icons = {
	"": {"texture": preload("res://assets/graphics/generic_tools/genericItem_color_086.png"), "hotzone": Vector2.ZERO},
	"screwdriver": {"texture": preload("res://assets/graphics/generic_tools/genericItem_color_005.png"), "hotzone": Vector2(50, 0)},
	"ducttape": {"texture": preload("res://assets/graphics/custom_tools/duct_tape.png"), "hotzone": Vector2(25, 25)},
	"hammer": {"texture": preload("res://assets/graphics/generic_tools/genericItem_color_010.png"), "hotzone": Vector2(50, 25)}
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_members()
	init_screws()
	init_state()
	trigger_update()	
	self.tool = ""
	Input.set_custom_mouse_cursor(tool_icons[self.tool].texture, 0, tool_icons[self.tool].hotzone)

var pressed = false

func set_tool(tool: String):
	self.tool = tool
	Input.set_custom_mouse_cursor(tool_icons[self.tool].texture, 0, tool_icons[self.tool].hotzone)

func init_members():
	pass

func init_state():
	pass

func init_screws(with_state: bool = true):
	for element in get_children():
		if element is Screw:
			if !screws.has(element.group):
				screws[element.group] = []
			screws[element.group].append(element)
			if with_state:
				state.setProp(element.id, element.default_state)

func update_screws():
	for group in screws:
		for screw in screws[group]:
			screw.animation = "idle_screw" if state.getProp(screw.id) else "idle_hole"

func set_active_screw_group(group: String, is_active: bool):
	for screw in screws[group]:
		screw.is_active = is_active

func is_screw_group_open(group: String):
	for screw in screws[group]:
		if state.getProp(screw.id):
			return false
	return true

func trigger_update():
	update()
	update_screws()

func update():
	pass

func hover():
	for element in get_children():
		if isActiveElement(element):
			element.set_outline(false)
	var top_node = topmost_hovered_node()
	if top_node:
		top_node.set_outline(true)
	

func _input(event):
	if !is_open:
		return
	if event is InputEventMouseMotion:
		hover()
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and !pressed:
			pressed = true
			var top_node = topmost_hovered_node()
			if top_node != null:
				top_node.clicked(self.tool, self)
				trigger_update()
				hover()
		elif event.is_released():
			pressed = false
		

func isActiveElement(element: Node):
	return (element is ActiveBombElementAnimated or element is ActiveBombElementSprite) and element.visible == true



func topmost_hovered_node() -> Node:
	var top_node = null
	for element in get_children():
		if isActiveElement(element) and element.is_mouse_over_non_alpha() and element.is_active:
			top_node = element
	return top_node
			
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
