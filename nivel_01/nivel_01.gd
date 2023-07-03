extends Node2D

const novo_knight = preload("res://nivel_01/scenes/knights.tscn")

var pista_lenta = [600, 488, 437, 323, 215]#, 160]
var pista_rapida = [543, 384, 274, 160]#, 103]

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setando o Timer: receber esse valor da cena anterior???
	$Timer.set_wait_time(60) # 1 minuto???
	# Iniciando a música.
	$Tema.play()
	# Setup do seeder para funções de aleatoriedade.
	randomize()
	# Mostra botão de iniciar
	$Button_start.show()
	$Button_start.grab_focus()
	$Player_Crossing.speed = 0
	# Escondendo o botão de fim de jogo
	$Button_end.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var timer = $Timer.get_time_left()
	$Label_Timer.text = "%d:%02d" % [floor(timer / 60), int(timer) % 60]


func _on_timer_knight_rapido_timeout():
	# Instancia o knight e adiciona na cena Main
	var knight_rapido = novo_knight.instantiate()
	add_child(knight_rapido)
	
	# Seleciona a pista aleatoriamente
	var i = randi() % pista_rapida.size()
	knight_rapido.position.y = pista_rapida[i]
	
	# Se par, corre para a direita
	if fmod(i, 2) == 0:
		# Coloca o knight fora da tela para que ele entre
		knight_rapido.position.x = -10
		# Define a velocidade aleatoriamente dentor do range
		knight_rapido.linear_velocity = Vector2(randi_range(450, 500), 0)
	# Se ímpar, corre para a esquerda
	else:
		# Coloca o knight fora da tela para que ele entre
		knight_rapido.position.x = 1290
		# Define a velocidade aleatoriamente dentor do range
		knight_rapido.linear_velocity = Vector2(randi_range(-450, -500), 0)
		# Inverte a figura
		#knight_rapido.scale.x = -1
		#knight_rapido.set_rotation_degrees(180)
		
	

func _on_timer_knight_lento_timeout():
	# Instancia o knight e adiciona na cena Main
	var knight_lento = novo_knight.instantiate()
	add_child(knight_lento)
	
	# Seleciona a pista aleatoriamente
	var i = randi() % pista_lenta.size()
	knight_lento.position.y = pista_lenta[i]
	
	# Se par, corre para a direita
	if fmod(i, 2) == 0:
		# Coloca o knight fora da tela para que ele entre
		knight_lento.position.x = -10
		# Define a velocidade aleatoriamente dentor do range
		knight_lento.linear_velocity = Vector2(randi_range(250, 270), 0)
	# Se position.y <= 350, knights da direita para a esquerda
	else:
		# Se ímpar, corre para a esquerda
		knight_lento.position.x = 1290
		# Define a velocidade aleatoriamente dentor do range
		knight_lento.linear_velocity = Vector2(randi_range(-250, -270), 0)
		# Inverte a figura
		#knight_lento.set_rotation_degrees(180)
	

# FUNÇÃO PARA VITÓRIA DO JOGADOR
func _on_player_crossing_pontua():
	$Tema.stop()
	$Venceu.play()
	$Timer.paused = true
	$Timer_knight_lento.stop()
	$Timer_knight_rapido.stop()
	$Player_Crossing.speed = 0
	$Button_end.text = "Você venceu!!!\n\nClique para a próxima fase."
	$Button_end.show()
	$Button_end.grab_focus()
	# Adicionar pontos
	DadosGlobal.ganhar_ponto()
	
	

# FUNÇÃO PARA DERROTA DO JOGADOR
func _on_timer_timeout():
	DadosGlobal.perde_vida()
	$Button_end.text = "Você perdeu...\n\nClique para a próxima fase!"
	$Button_end.show()
	$Button_end.grab_focus()
	# Excluir pontos
	# Mostrar mensagem com botão de próxima fase...
	$Timer_knight_lento.stop()
	$Timer_knight_rapido.stop()
	$Player_Crossing.speed = 0
	


func _on_button_proximo_pressed():
	$Tema.stop()
	if DadosGlobal.numero_vidas <= 0:
		DadosGlobal.numero_vidas = 3
		get_tree().change_scene_to_file("res://start_screen.tscn")
	else:
		#get_tree().change_scene_to_file("res://nivel_01/nivel_01.tscn")
		get_tree().change_scene_to_file("res://nivel_02/nivel_02.tscn")
	


func _on_button_start_pressed():
	$Player_Crossing.speed = 100
	$Button_start.hide()
	$Timer.start()
	

