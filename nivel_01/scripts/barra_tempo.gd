extends Line2D

func downcounting():
	points[1].x -= 80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	#downcounting()
	if points[1].x == -40:
		get_tree().change_scene_to_file("res://level_2.tscn")
