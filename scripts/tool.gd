extends Node2D

signal doAction(action : String, active : bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_use_tool(tool : String):
	match tool:
		"axe":
			pass
		"ducttape": 
			pass
		"frying_pan":
			pass
		"pliers":
			pass
		"screwdriver":
			pass
		"torch":
			doAction.emit()
		"wd_40":
			pass
