extends Area2D


func _ready():
	pass # Replace with function body.

func _on_body_entered(body):
	var pocao = get_node("/root/Nivel01/Poção/Sprite2D")
	for node in get_tree().get_nodes_in_group("barril"):
		if node.region_rect.position.x == pocao.region_rect.position.x:
			print('igual')
