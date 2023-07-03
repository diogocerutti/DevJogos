extends Area2D

func _ready():
	DadosGlobal.ponto.connect(atualizar_tela)
	verifica_vitoria()
	
func _process(delta):
	verifica_vitoria()
	
var barril1 = false
var barril2 = false
var barril3 = false
var barril4 = false

func _on_body_entered_area_barril1(body):
	print(body)
	if body.get_node('Sprite2D').region_rect.position.x == get_node('/root/Nivel01/Barris/Barril1').region_rect.position.x:
		DadosGlobal.ganhar_ponto(5)
		barril1 = true
		print(barril1)
	
func _on_body_entered_area_barril2(body):
	print(body)
	if body.get_node('Sprite2D').region_rect.position.x == get_node('/root/Nivel01/Barris/Barril2').region_rect.position.x:
		DadosGlobal.ganhar_ponto(5)
		barril2 = true
		print(barril2)

func _on_body_entered_area_barril3(body):
	print(body)
	if body.get_node('Sprite2D').region_rect.position.x == get_node('/root/Nivel01/Barris/Barril3').region_rect.position.x:
		DadosGlobal.ganhar_ponto(5)
		barril3 = true
		print(barril3)
	
func _on_body_entered_area_barril4(body):
	if body.get_node('Sprite2D').region_rect.position.x == get_node('/root/Nivel01/Barris/Barril4').region_rect.position.x:
		DadosGlobal.ganhar_ponto(5)
		barril4 = true
		print(barril4)
	
func verifica_vitoria():
	if barril1 && barril2 && barril3 && barril4 == true:
		DadosGlobal.ganhar_ponto(10)
		print('GANHOI')

func atualizar_tela():
	%PontosLabel.text = "Pontos: {pontos}".format({
		"pontos": DadosGlobal.numero_pontos
	})
