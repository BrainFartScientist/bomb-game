extends Sprite2D

signal mouse_over_non_alpha

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventMouseMotion:
		if is_topmost_and_non_alpha():
			material.set("shader_param/hasOutline", true);
		else:
			material.set("shader_param/hasOutline", false);

func is_topmost_and_non_alpha() -> bool:
	if !is_mouse_over_non_alpha():
		return false
	return is_topmost_at_mouse()
	
func is_topmost_at_mouse() -> bool:
	var topmost_sprite = self
	for node in get_parent().get_children():
		if node is Sprite2D and node.texture and node.has_method("is_mouse_over_non_alpha") and node.is_mouse_over_non_alpha():
			topmost_sprite = node
	return topmost_sprite == self

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
