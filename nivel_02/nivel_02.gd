extends Node

var flecha_nova = preload("res://nivel_02/scenes/flecha_nivel02.tscn")
var time_limit = 30

func _ready():
	$Tema.play()
	$Timer.set_wait_time(time_limit) # 30 segundos
	# MOSTRAR BOTÃO COM INSTRUÇÕES
	$Button_start.show()
	$Button_start.grab_focus()
	$player_nivel02.speed = 0
	# Escondendo o botão de fim de jogo
	$Button_end.hide()
	


func _on_timer_flecha_timeout():
	for i in randi_range(5, 8):
		add_child(flecha_nova.instantiate())
	

func _process(delta):
	var timer = $Timer.get_time_left()
	$Label_Timer.text = "%d:%02d" % [floor(timer / 60), int(timer) % 60]


func _on_player_nivel_02_morreu():
	DadosGlobal.perde_vida()
	DadosGlobal.ganhar_ponto(time_limit - int($Timer.time_left))
	$Timer.paused = true
	$Button_end.text = "Você perdeu...\n\nClique para a próxima fase!"
	$Button_end.show()
	$Button_end.grab_focus()
	$TimerFlecha.stop()
	$Tema.stop()
	$player_nivel02.speed = 0
	#get_tree().change_scene_to_file("res://nivel_02.tscn")


func _on_timer_timeout():
	
	$player_nivel02.get_node("CollisionShape2D").disabled = true
	$player_nivel02.speed = 0
	$Timer.set_wait_time(0)
	$Timer.stop()
	$TimerFlecha.stop()
	$Tema.stop()
	$Victory.play()
	
	DadosGlobal.ganhar_ponto(time_limit)

	$Button_end.text = "Você venceu!!!\n\nClique para a próxima fase."
	$Button_end.show()
	$Button_end.grab_focus()
	# Adicionar pontos
	

func _on_button_start_pressed():
	$player_nivel02.speed = 200
	$Button_start.hide()
	$Timer.start()
	$TimerFlecha.start()


func _on_button_end_pressed():
	$Tema.stop()
	if DadosGlobal.numero_vidas <= 0:
		DadosGlobal.numero_vidas = 3
		get_tree().change_scene_to_file("res://start_screen.tscn")
	else:
		#get_tree().change_scene_to_file("res://nivel_03/nivel_03.tscn")
		get_tree().change_scene_to_file("res://nivel_01/nivel_01.tscn")
