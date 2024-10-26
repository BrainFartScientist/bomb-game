extends Node2D
@onready var window_sprite: Sprite2D = $WindowSprite
@onready var collisionsquare: CollisionShape2D = $CollisionArea/Collisionsquare
@onready var collision_area: Area2D = $CollisionArea
@onready var static_body_2d: StaticBody2D = $StaticBody2D

var has_outline : bool


var sprite

func _ready() -> void:
	sprite = get_node("WindowSprite")

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.add_interactive_element(self)

func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.remove_interactive_element(self)
		set_outline(false)

func interact(player: Node):
	if player.holdingTool == "hammer":
		window_sprite.hide()
		queue_free()

func set_outline(has_outline: bool):
	self.has_outline = has_outline
	sprite.material.set("shader_param/hasOutline", self.has_outline)
