extends Node

signal ponto

var texturas = [10, 74, 138, 202, 266, 330, 394, 458, 522, 586]
var texturas_random = []

var numero_pontos = 0

var ganhoulvl1 = false

func _ready():
	variar_textura()

func ganhar_ponto():
	numero_pontos += 5
	ponto.emit()

func variar_textura():
	texturas.shuffle()
	texturas_random = texturas.slice(4)
