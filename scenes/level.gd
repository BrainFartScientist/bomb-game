extends Node2D

@onready var interactive_tiles: TileMapLayer = $interactiveTiles
var windowTiles : Array
var tile
var hasHammer = true
var groundLayer = 1

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass

	
func _input(event: InputEvent) -> void:
	
	if Input.is_action_just_pressed("click"):
		var tilepos = interactive_tiles.local_to_map(get_global_mouse_position())
		if interactive_tiles.get_cell_tile_data(tilepos).get_custom_data("window") && hasHammer:
			interactive_tiles.set_cell(tilepos, 1, Vector2i(11,10))
			print("change tile")
		else: print("no")
		
