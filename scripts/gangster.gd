extends npc_stationary

var last_glb_position = Vector2.ZERO
var last_vector = self.global_position - last_glb_position
func _ready():
	randomize()
	start_pos = position
	

func _process(delta):
	$AnimatedSprite2D.play("walk_right")
	var current_move_vec = self.global_position - last_glb_position
	if current_move_vec[0] > last_vector[0]:
		$AnimatedSprite2D.flip_h = false
	elif current_move_vec[0] < last_vector[0]:
		$AnimatedSprite2D.flip_h = true
	last_vector = current_move_vec
		
	if Input.is_action_just_pressed("chat"):
		pass		
