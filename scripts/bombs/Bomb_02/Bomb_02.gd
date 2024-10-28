extends Bomb

var displays = []
var buttons = []

@onready var cover1 = $Cover1
@onready var cover2 = $Cover2
@onready var cable1 = $BrokenCable1
@onready var cable2 = $BrokenCable2
@onready var button = $Button
@onready var valve = $Valve
@onready var gauge = $Fuel
@onready var hint = $Hint

func init_members():
	for i in range(1, 5):
		displays.append(get_node("BombDisplay_" + str(i)))
	for i in range(1, 11):
		buttons.append(get_node("BombButton_" + str(i)))
	pass
	
func init_state():
	set_tool("screwdriver")
	state.setProp("numbers", [])
	state.setProp("CoverOpen1", false)
	state.setProp("CoverOpen2", false)
	state.setProp("CableFixed1", false)
	state.setProp("CableFixed2", false)
	state.setProp("ValveOpen", false)
	state.setProp("Refilled", false)
	pass
	
func update():
	
	cable1.animation = "idle_fixed" if state.getProp("CableFixed1") else "idle_broken"	
	cable1.is_active = !state.getProp("CableFixed1") and state.getProp("CoverOpen1")
	
	cable2.animation = "idle_fixed" if state.getProp("CableFixed2") else "idle_broken"	
	cable2.is_active = !state.getProp("CableFixed2") and state.getProp("CoverOpen1")	
	
	button.animation = "idle_active" if state.getProp("CableFixed1") else "idle_inactive"
	button.is_active = state.getProp("CableFixed1")
	
	cover2.visible = !state.getProp("CoverOpen2")
	
	valve.animation = "idle_open" if state.getProp("ValveOpen") else "idle_closed"
	hint.visible = state.getProp("ValveOpen")
	valve.is_active = !state.getProp("Refilled")
	gauge.animation = "idle_empty" if !state.getProp("Refilled") else "idle_full"
	
	for button in buttons:
		button.is_active = state.getProp("Refilled")
	
	var numbers = state.getProp("numbers")
	if numbers.size() == 4:
		if numbers[0] == 1 and numbers[1] == 1 and numbers[2] == 1 and numbers[3] == 1:
			get_tree().change_scene_to_file("res://scenes/you_win_screen.tscn")
		else:
			state.setProps("numbers", [])
	for i in range(4):
		if numbers.size() > i:
			displays[i].set_number(numbers[i])
		else:
			displays[i].remove_number()
	
	cover1.is_active = is_screw_group_open("cover")
	set_active_screw_group("cover", !state.getProp("CoverOpen1"))
	cover1.visible = !state.getProp("CoverOpen1")	
	
	
