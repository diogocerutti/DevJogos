extends Node

var flecha_nova = preload("res://nivel_02/scenes/flecha_nivel02.tscn")


func _ready():
	$Tema.play()
	$Timer.set_wait_time(60) # 1 minuto???
	# MOSTRAR BOTÃO COM INSTRUÇÕES
	$Button_start.show()
	$Button_start.grab_focus()
	$player_nivel02.speed = 0
	# Escondendo o botão de fim de jogo
	$Button_end.hide()
	


func _on_timer_flecha_timeout():
	for i in randi_range(5, 8):
		add_child(flecha_nova.instantiate())
	


func _on_player_nivel_02_morreu():
	DadosGlobal.perde_vida()
	$Button_end.text = "Você perdeu...\n\nClique para a próxima fase!"
	$Button_end.show()
	$Button_end.grab_focus()
	$TimerFlecha.stop()
	$Tema.stop()
	$player_nivel02.speed = 0
	#get_tree().change_scene_to_file("res://nivel_02.tscn")


func _on_player_nivel_02_venceu():
	$Tema.stop()
	$Victory.play()
	$Timer.paused = true
	$TimerFlecha.stop()
	$player_nivel02.speed = 0
	$Button_end.text = "Você venceu!!!\n\nClique para a próxima fase."
	$Button_end.show()
	$Button_end.grab_focus()
	# Adicionar pontos
	DadosGlobal.ganhar_ponto()


func _on_flag_nivel_02_body_entered(body):
	$Tema.stop()
	$Victory.play()
	$Timer.paused = true
	$TimerFlecha.stop()
	$player_nivel02.speed = 0
	$Button_end.text = "Você venceu!!!\n\nClique para a próxima fase."
	$Button_end.show()
	$Button_end.grab_focus()
	# Adicionar pontos
	DadosGlobal.ganhar_ponto()


func _on_timer_timeout():
	DadosGlobal.perde_vida()
	$Button_end.text = "Você perdeu...\n\nClique para a próxima fase!"
	$Button_end.show()
	$Button_end.grab_focus()
	$TimerFlecha.stop()
	$Tema.stop()
	$player_nivel02.speed = 0
	#get_tree().change_scene_to_file("res://nivel_02.tscn")


func _on_button_start_pressed():
	$player_nivel02.speed = 200
	$Button_start.hide()
	$Timer.start()


func _on_button_end_pressed():
	$Tema.stop()
	if DadosGlobal.numero_vidas <= 0:
		DadosGlobal.numero_vidas = 3
		get_tree().change_scene_to_file("res://start_screen.tscn")
	else:
		get_tree().change_scene_to_file("res://nivel_03/nivel_03.tscn")
