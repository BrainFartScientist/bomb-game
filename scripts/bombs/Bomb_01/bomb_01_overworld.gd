extends Node2D

var player_in_range = false;
var sprite

func _ready() -> void:
	sprite = get_node("Bomb01Overworld")

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		sprite.material.set("shader_param/hasOutline", true)
		player_in_range = true


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		sprite.material.set("shader_param/hasOutline", false)
		player_in_range = false

func _process(delta):
	if Input.is_action_just_pressed("chat"):
		GameState.access_bomb("res://scenes/level.tscn", "res://scenes/bomb.tscn")
