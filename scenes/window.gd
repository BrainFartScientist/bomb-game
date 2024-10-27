extends Node2D
@onready var window_sprite: Sprite2D = $WindowSprite
@onready var collisionsquare: CollisionShape2D = $CollisionArea/Collisionsquare
@onready var collision_area: Area2D = $CollisionArea
@onready var static_body_2d: StaticBody2D = $StaticBody2D
@onready var glass: AudioStreamPlayer2D = $glass

var has_outline : bool
var destroyed  = false
var sprite

func _ready() -> void:
	pass

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.add_interactive_element(self)

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.remove_interactive_element(self)


func interact(player: Node):
	if player.holdingTool == "hammer":
		if destroyed == false: 
			glass.play()
			window_sprite.hide()
			static_body_2d.queue_free()
			destroyed = true
