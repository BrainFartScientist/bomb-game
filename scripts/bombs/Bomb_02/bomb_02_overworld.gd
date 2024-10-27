extends Node2D

var player_in_range = false;
var has_outline = false

var sprite

func _ready() -> void:
	sprite = get_node("Bomb02Overworld")

func _on_interaction_area_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.add_interactive_element(self)


func _on_interaction_area_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		body.remove_interactive_element(self)
		set_outline(false)

func interact(player: Node):
	get_tree().root.get_child(0).open_bomb("Bomb_02", player.holdingTool)

func set_outline(has_outline: bool):
	self.has_outline = has_outline
	sprite.material.set("shader_param/hasOutline", self.has_outline)
