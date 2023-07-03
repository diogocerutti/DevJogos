extends Sprite2D

func _ready():
	if get_index() == 0:
		region_rect.position.x = DadosGlobal.texturas_random[0]
	if get_index() == 2:
		region_rect.position.x = DadosGlobal.texturas_random[1]
	if get_index() == 4:
		region_rect.position.x = DadosGlobal.texturas_random[2]
	if get_index() == 6:
		region_rect.position.x = DadosGlobal.texturas_random[3]
