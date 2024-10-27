extends npc_stationary

var last_glb_position = Vector2.ZERO
var last_vector = self.global_position - last_glb_position
@onready var detection_cone = $Polygon2D
@onready var raycast = $RayCast2D
@onready var raycast2 = $RayCast2D2
@onready var raycast3 = $RayCast2D3
@onready var raycast4 = $RayCast2D4
@onready var raycast5 = $RayCast2D5
@onready var raycast6 = $RayCast2D6
@onready var raycast7 = $RayCast2D7
@onready var raycast8 = $RayCast2D8
@onready var raycast9 = $RayCast2D9

var raycasts = []
var angles = []
func _ready():
	raycasts = [raycast, raycast2, raycast3, raycast4, raycast5, raycast6, raycast7, raycast8, raycast9]
	randomize()
	start_pos = position
	for ray in raycasts:
		angles.append(ray.rotation)
	print(angles)

func _process(delta):
	var pathfollow = get_parent()
	
	$AnimatedSprite2D.play("walk_right")
	var current_move_vec = self.global_position - last_glb_position
	var rotationangle = last_vector.angle_to_point(current_move_vec)
	detection_cone.rotation = rotationangle

	# Set the RayCast2D direction based on the cone's angle
	var i = 0
	for ray in raycasts:
		if ray.is_colliding():
			var collider = ray.get_collider()
			if collider != null:
				if (collider.name == "Player"): # Ensure your player is in the "players" group
					get_tree().change_scene_to_file("res://scenes/game_over_screen.tscn")
		else:
			pass	
		ray.rotation = (rotationangle + angles[i])
		ray.force_raycast_update()
		i += 1

	# Update the sprite flip based on movement direction
	if current_move_vec.x > last_vector.x:
		$AnimatedSprite2D.flip_h = false
	elif current_move_vec.x < last_vector.x:
		$AnimatedSprite2D.flip_h = true

	last_vector = current_move_vec

	if Input.is_action_just_pressed("chat"):
		pass
