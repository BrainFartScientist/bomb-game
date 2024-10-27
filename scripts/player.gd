extends CharacterBody2D


const SPEED = 250
const JUMP_VELOCITY = -300.0
var holdingTool : String
signal useTool(String)
var cooldown = 0
@onready var tool_inv = $Gui/ToolRect
@onready var equip = $equip
@onready var music = $music
@onready var glass = $glass
@onready var holdingToolVisual = $holdingToolVisual
var interactiveElements = []

@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	music.play()
	add_child(holdingToolVisual)
	holdingToolVisual.scale = Vector2(0.12, 0.12)
	holdingToolVisual.position = Vector2(7, -10)
	
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
	if Input.is_action_just_pressed("use_item") and cooldown <= 0:
		var i = 1
		if holdingToolVisual.flip_h == true:
			i = -1
		match (holdingTool):
			"axt":
				holdingToolVisual.rotation = deg_to_rad(45 * i)
			"hammer":
				holdingToolVisual.rotation = deg_to_rad(45 * i)
			"frying_pan":
				holdingToolVisual.rotation = deg_to_rad(45 * i)	
		cooldown = 0.3 
	cooldown -= delta
	if cooldown <= 0.2:
		holdingToolVisual.rotation = deg_to_rad(0)
	
func set_holding_tool(tool: String):
	equip.play()
	self.holdingTool = tool
	tool_inv.display_tool(tool)
	holdingToolVisual.changeTool(tool)

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
	var xdirection := Input.get_axis("move_left", "move_right")
	var ydirection := Input.get_axis("move_up", "move_down") 
	if xdirection:
		velocity.x = xdirection * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	# Flip the Sprite vertical
	if xdirection > 0:
		animated_sprite.flip_h = false
		holdingToolVisual.flip_h = false
	elif xdirection < 0:
		animated_sprite.flip_h = true
		if holdingTool != "wd_40":
			holdingToolVisual.flip_h = true
		
	# Get the vertical input direction for up/down movement.
	if ydirection != 0:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	# Play animations
	if xdirection || ydirection != 0:
		animated_sprite.play("run")
	else: animated_sprite.play("idle")
	
	move_and_slide()
