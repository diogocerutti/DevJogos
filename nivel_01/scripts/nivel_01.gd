extends Node2D

var held_object = false
var pausado = false

func _ready():
	for node in get_tree().get_nodes_in_group("pickable"):
		node.clicked.connect(_on_pickable_clicked)
	DadosGlobal.ponto.connect(atualizar_tela)

#func _process(delta):
#	verifica()

func _on_pickable_clicked(object):
	if !held_object:
		object.pickup()
		held_object = object
		
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if held_object and !event.pressed:
			held_object.drop(Input.get_last_mouse_velocity() / 5.0)
			held_object = null

func atualizar_tela():
	%PontosLabel.text = "Pontos: {pontos}".format({
		"pontos": DadosGlobal.numero_pontos
	})
	
#func verifica():
#	var quadrado = get_node("Quadrado")
#	var triangulo = get_node("Triangulo")
#	var circulo = get_node("Circulo")
#	if quadrado.quadradoIn == true && triangulo.trianguloIn == true && circulo.circuloIn == true:
#		$Certo.visible = true
#		$Errado.visible = false
#		DadosGlobal.ganhar_ponto()
#	else:
#		$Certo.visible = false
#		$Errado.visible = true

func _on_pausar_button_down():
	get_tree().paused = true

#func _on_body_entered(body):
#	var pocao = get_node("/root/Nivel01/Poção/Sprite2D")
#	print(pocao.region_rect)
