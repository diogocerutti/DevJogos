extends Node2D

var chuva = preload("res://chuva.tscn")

func _on_timer_timeout():
	var obstaculo = chuva.instantiate()
	obstaculo.position = Vector2(randf_range(20, 1280), -20)
	add_child(obstaculo)

func _on_area_2d_body_entered(body):
	if body is Player:
		get_tree().change_scene_to_file("res://fase_formas.tscn")
