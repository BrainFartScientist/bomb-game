extends Sprite2D
class_name ActiveBombElementSprite

@export var is_active = true

func clicked(item: String, bomb: Bomb):
	print("Click Event: Node: %s Item: %s Bomb: %s" % [self, item, bomb])

func set_outline(hasOutline: bool):
	material.set("shader_param/hasOutline", hasOutline)

func is_mouse_over_non_alpha() -> bool:
	# Get the mouse position relative to the sprite
	var local_pos = to_local(get_viewport().get_mouse_position())
	# Check if the position is within the texture bounds
	if local_pos.x < -(texture.get_width()/2) or local_pos.y < -(texture.get_height()/2) or local_pos.x >= texture.get_width()/2 or local_pos.y >= texture.get_height()/2:
		return false
	local_pos.x += texture.get_width() / 2
	local_pos.y += texture.get_height() / 2
	# Sample the alpha value at the specific pixel
	
	var image = texture.get_image()
	return image.get_pixel(local_pos.x, local_pos.y).a > 0.1  # Adjust this threshold if needed
