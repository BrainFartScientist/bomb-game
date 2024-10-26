extends CharacterBody2D


const SPEED = 250
const JUMP_VELOCITY = -300.0
var holdingTool : String
signal useTool(String)
var cooldown : int
@onready var tool_inv = $Gui/ToolRect
var interactiveElements = []

@onready var animated_sprite = $AnimatedSprite2D

func _process(delta):
	var nearerst_node = null
	var nearest_length = 10000000000000000
	for element in interactiveElements:
		if element.has_method("set_outline"):
			element.set_outline(false)
		if position.distance_to(element.position) < nearest_length:
			nearerst_node = element
			nearest_length = position.distance_to(element.position)
	
	if nearerst_node != null:
		if nearerst_node.has_method("set_outline"):
			nearerst_node.set_outline(true)
		if Input.is_action_just_pressed("use_item") and nearerst_node.has_method("interact"):
			nearerst_node.interact(self)
	
func set_holding_tool(tool: String):
	self.holdingTool = tool
	tool_inv.display_tool(tool)

func add_interactive_element(new_element: Variant):
	for element in interactiveElements:
		if element == new_element:
			return
	interactiveElements.append(new_element)

func remove_interactive_element(del_element: Variant):
	for i in range(interactiveElements.size()):
		if interactiveElements[i] == del_element:
			interactiveElements.remove_at(i)
			return

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	
	# Get the input direction and handle the movement/deceleration.
	# Get the input direction: -1, 0, 1
	
	# Get the horizontal input direction for letf/right movement.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Flip the Sprite vertical
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Get the vertical input direction for up/down movement.
	var vertical_direction := Input.get_axis("move_up", "move_down")
	if vertical_direction != 0:
		velocity.y = vertical_direction * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	# Play animations
	if direction and vertical_direction == 0:
		animated_sprite.play("run")
	else: animated_sprite.play("idle")
	
	move_and_slide()
