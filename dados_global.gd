extends Node

signal ponto
signal morte

var numero_pontos = 0
var numero_vidas = 3

var ganhoulvl1 = false

func ganhar_ponto():
	numero_pontos += 5
	ponto.emit()

func perde_vida():
	numero_vidas -= 1
	morte.emit()
	#if numero_vidas <= 0:
	#	numero_vidas = 3
	#	get_tree().change_scene_to_file("res://start_screen.tscn")
