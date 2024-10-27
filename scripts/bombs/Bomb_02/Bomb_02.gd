extends Bomb

var displays = []

func init_members():
	for i in range(1, 5):
		displays.append(get_node("BombDisplay_" + str(i)))
	pass
	
func init_state():
	state.setProp("numbers", [])
	pass
	
func update():
	var numbers = state.getProp("numbers")
	for i in range(4):
		if numbers.size() > i:
			displays[i].set_number(numbers[i])
		else:
			displays[i].remove_number()
	pass
