extends Bomb
var cables: AnimatedSprite2D; 
var cover: ActiveBombElementSprite
var inside: ActiveBombElementSprite

func init_members():
	cables = get_node("Cables") as AnimatedSprite2D
	cover = get_node("Cover") as ActiveBombElementSprite
	inside = get_node("Inside") as ActiveBombElementSprite
	
func init_state():
	state.setProp("CablesFixed", false)
	state.setProp("CoverOpen", false)

func update():
	cables.animation = "idle_fixed" if state.getProp("CablesFixed") else "idle_broken"	
	cables.is_active = !state.getProp("CablesFixed")	
	
	cover.is_active = is_screw_group_open("cover") 
	set_active_screw_group("cover", !state.getProp("CoverOpen"))
	cover.visible = !state.getProp("CoverOpen")
	
	inside.is_active = state.getProp("CoverOpen")
	
	
