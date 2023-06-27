extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	$Controls/StartBtn.grab_focus()

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://nivel_01.tscn")

func _on_controls_btn_pressed():
	#var controlScreen = load("res://controls_screen.tscn").instance()
	#get_tree().current_scene.add_child(controlScreen)
	get_tree().change_scene_to_file("res://controls_screen.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()
