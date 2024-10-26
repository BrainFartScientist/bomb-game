extends Node2D

@onready var interactive_tiles: TileMapLayer = $interactiveTiles
#var windowTiles : Array
#var tile
#var hasHammer = true
#var groundLayer = 1
#var player_in_range = false;
#var sprite

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

	
#func _input(event: InputEvent) -> void:
	#
	#if Input.is_action_just_pressed("click"):
		#var tilepos = interactive_tiles.local_to_map(get_global_mouse_position())
		#if interactive_tiles.get_cell_tile_data(tilepos).get_custom_data("window") && hasHammer:
			#interactive_tiles.set_cell(tilepos, 1, Vector2i(11,10))
			#print("change tile")
		#else: print("no")
		

#func _on_interaction_area_body_entered(body: Node2D) -> void:
	#if body.name == "Player":
		#player_in_range = true


#func _on_interaction_area_body_exited(body: Node2D) -> void:
	#if body.name == "Player":
		#sprite.material.set("shader_param/hasOutline", false)
		#player_in_range = false
#
#func _process(delta):
	#if Input.is_action_just_pressed("chat") and player_in_range:
		#GameState.access_bomb("res://scenes/level.tscn", "res://scenes/bomb.tscn")
		
