extends Node2D
class_name Bomb

var state = BombState.new()
var screws = {}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	init_screws()
	init_state()
	trigger_update()

var pressed = false

func init_state():
	pass

func init_screws():
	for element in get_children():
		if element is Screw:
			if !screws.has(element.group):
				screws[element.group] = []
			screws[element.group].append(element)
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
	if event is InputEventMouseMotion:
		hover()
	elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed() and !pressed:
			pressed = true
			var top_node = topmost_hovered_node()
			if top_node != null:
				top_node.clicked("Item here", self)
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
