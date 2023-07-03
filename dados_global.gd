extends Node

signal ponto
signal morte

var texturas = [10, 74, 138, 202, 266, 330, 394, 458, 522, 586]
var texturas_random = []

var numero_pontos = 0
var numero_vidas = 3

var ganhoulvl1 = false


func _ready():
	variar_textura()


func variar_textura():
	texturas.shuffle()
	texturas_random = texturas.slice(4)


func ganhar_ponto(pontos: int):
	numero_pontos += pontos
	ponto.emit()


func perde_vida():
	numero_vidas -= 1
	morte.emit()
	#if numero_vidas <= 0:
	#	numero_vidas = 3
	#	get_tree().change_scene_to_file("res://start_screen.tscn")
