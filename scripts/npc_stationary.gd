extends CharacterBody2D
class_name npc_stationary

var start_pos

var is_chatting = false

var player
var player_in_chat_zone = false


func _ready():
	randomize()
	start_pos = position
	
func _process(delta):
	$AnimatedSprite2D.play("idle_down")
				
	if Input.is_action_just_pressed("chat"):
		if player_in_chat_zone: 
			print("is chatting with the npc")
			is_chatting = true
			$Dialog.start()
		
func choose(array):
	array.shuffle()
	return array.front()

func _on_chat_detection_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player = body
		player_in_chat_zone = true


func _on_chat_detection_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		$Dialog.stop()
		player_in_chat_zone = false


func _on_dialog_dialog_finished() -> void:
	is_chatting = false
