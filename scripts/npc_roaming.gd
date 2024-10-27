extends npc_stationary

const speed = 60
var current_state = IDLE

var dir = Vector2.DOWN
var is_roaming = true

enum {
	IDLE,
	NEW_DIR,
	MOVE,
}

func _ready():
	randomize()
	start_pos = position
	
func _process(delta):
	if current_state == 0 or current_state == 1:
		$AnimatedSprite2D.play("idle_down")
	elif current_state == 2 and !is_chatting:
		if dir.x == -1:
			$AnimatedSprite2D.play("walk_left")
		if dir.x == 1:
			$AnimatedSprite2D.play("walk_right")
		if dir.y == -1:
			$AnimatedSprite2D.play("walk_up")
		if dir.y == 1:
			$AnimatedSprite2D.play("walk_down")
			
	if is_roaming:
		match current_state:
			IDLE:
				pass
			NEW_DIR:
				dir = choose([Vector2.RIGHT, Vector2.UP, Vector2.LEFT, Vector2.DOWN])
			MOVE: 
				move(delta)
				
	if Input.is_action_just_pressed("chat"):
		if player_in_chat_zone: 
			print("is chatting with the npc")
			is_chatting = true
			is_roaming = false
			$Dialog.start()
			$AnimatedSprite2D.play("idle_down")

func move(delta):
	if !is_chatting:
		position += dir * speed * delta

func _on_timer_timeout():
	$Timer.wait_time = choose([0.5, 1, 1.5])	
	current_state = choose([IDLE, NEW_DIR, MOVE])
	if !is_chatting:
		is_roaming = true

func _on_dialog_dialog_finished() -> void:
	is_chatting = false
	is_roaming = true
