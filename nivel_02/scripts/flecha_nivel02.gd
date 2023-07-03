extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D.apply_scale(Vector2(0.7, 0.7))
	scale = Vector2(0.1, 0.1)
	get_node("CollisionShape2D").disabled = true
	position.y = 300
	position.x = randi_range(100, 1200)
	linear_velocity = Vector2(0, randi_range(-1000,-1400))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	
	if $Sprite2D.flip_v == false:
		$Sprite2D.flip_v = true
		$Sprite2D.apply_scale(Vector2(1.5, 1.5))
		position.y = -100
		linear_velocity = Vector2(0, randi_range(600, 900))
		get_node("CollisionShape2D").disabled = false
	else:
		queue_free()
	

