extends Node

signal ponto

var numero_pontos = 0

var ganhoulvl1 = false

func ganhar_ponto():
	numero_pontos += 5
	ponto.emit()
