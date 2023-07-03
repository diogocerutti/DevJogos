extends Area2D


@export var speed = 200.0
var screen_size
var is_dead = false
signal venceu
signal morreu

# Called when the node enters the scene tree for the first time.
func _ready():
	
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play()
	$AnimatedSprite2D.animation = "iddle"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_dead:
		return
	
	var velocity = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "walking"
	else:
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "iddle"
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	
	if velocity.x > 0:
		$AnimatedSprite2D.flip_h = false
	elif velocity.x < 0:
		$AnimatedSprite2D.flip_h = true


func _on_body_entered(body):
	print("Player._on_body_entered: ", body.name)
	if body.name == "flag":
		emit_signal("venceu")
	elif !is_dead:
		is_dead = true
		$AnimatedSprite2D.play()
		$AnimatedSprite2D.animation = "death"
		$AudioMorte.play()
		emit_signal("morreu")

