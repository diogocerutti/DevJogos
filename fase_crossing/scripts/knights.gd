extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var cor_do_knight = $AnimatedSprite2D.sprite_frames.get_animation_names()
	var i = randi() % cor_do_knight.size()
	$AnimatedSprite2D.animation = cor_do_knight[i]
	$AnimatedSprite2D.play()
	

func _process(delta):
	var velocity = linear_velocity.normalized()
	if velocity[0] < 0:
		$AnimatedSprite2D.flip_h = true

func _on_visible_on_screen_notifier_2d_screen_exited():
	# Remove o item da memória após ele sair da tela.
	queue_free()
	
