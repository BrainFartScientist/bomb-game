extends Node2D
@onready var window_sprite: Sprite2D = $WindowSprite
@onready var collisionsquare: CollisionShape2D = $CollisionArea/Collisionsquare
@onready var collision_area: Area2D = $CollisionArea


var player_in_range = false;
var sprite

func _ready() -> void:
	sprite = get_node("WindowSprite")

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		sprite.material.set("shader_param/hasOutline", true)
		player_in_range = true


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		sprite.material.set("shader_param/hasOutline", false)
		player_in_range = false

func _process(delta):
	if Input.is_action_just_pressed("chat") and player_in_range:
		window_sprite.hide()
		#collision_area.set_disabled(true)
