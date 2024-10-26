extends CharacterBody2D


const SPEED = 250
const JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D

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
	elif xdirection < 0:
		animated_sprite.flip_h = true
	
	# Get the vertical input direction for up/down movement.
	if ydirection != 0:
		velocity.y = ydirection * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	# Play animations
	if xdirection == 0 && ydirection == 0:
		animated_sprite.play("idle")
	else: animated_sprite.play("run")
	
	move_and_slide()
