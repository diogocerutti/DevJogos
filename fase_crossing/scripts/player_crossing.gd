extends Area2D

var speed = 100
var screen_size
signal pontua

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite2D.play("iddle")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()
	
	# Verificar se está com seta para baixo pressionada:
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	
	# Verificar se está com seta para cima pressionada:
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		
	# Verificar se está com seta para esquerda pressionada:
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
		$AnimatedSprite2D.flip_h = true
	
	# Verificar se está com seta para direita pressionada:
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
		$AnimatedSprite2D.flip_h = false
	
	# Verifica se o personagem está se movendo:
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		#$AnimatedSprite2D.stop()
		$AnimatedSprite2D.animation = "iddle"
	
	# Faz o movimento na tela
	position += velocity * delta
	
	# Evita que saia da tela no eixo Y
	position.y = clamp(position.y, 0, screen_size.y)
	# Evita que saia da tela no eixo X
	position.x = clamp(position.x, 0, screen_size.x)

	# Verificar qual animação colocar:
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "running"
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "running"


func _on_body_entered(body):
	print("body.name:", body.name)
	# Verifica se colidiu com a linha de chegada:
	if body.name == "crossing_chegada":
		emit_signal("pontua")
	else:
		# Colidiu com um inimigo
		$AudioStreamPlayer2D.play()
	
	# Reposiciona o player na largada
	if body.name != "StaticBody2D":
		position.x = 640
		position.y = 680
