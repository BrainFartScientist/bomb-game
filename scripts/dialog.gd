extends Control

signal dialog_finished

@export_file("*.json") var d_file

var dialog = []
var current_dialog_id = 0
var d_active = false

func _ready():
	$NinePatchRect.visible = false
	
func start():
	if d_active:
		return
	$NinePatchRect.visible = true
	d_active = true
	dialog = load_dialog()
	current_dialog_id = -1
	next_script()
	
func stop():
	if !d_active:
		return
	$NinePatchRect.visible = false
	d_active = false
	current_dialog_id = 0
	
func load_dialog():
	var file = FileAccess.open("res://dialogs/boss_dialog_lvl1.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if !d_active:
		return
	if event.is_action_pressed("ui_accept"):
		next_script()

func next_script():
	current_dialog_id += 1
	if current_dialog_id >= len(dialog):
		d_active = false
		$NinePatchRect.visible = false
		emit_signal("dialog_finished")
		return
		
	$NinePatchRect/Name.text = dialog[current_dialog_id]['name']
	$NinePatchRect/Textspace.text = dialog[current_dialog_id]['text']
