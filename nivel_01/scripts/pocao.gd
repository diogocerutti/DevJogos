extends Sprite2D

func _ready():
	if(DadosGlobal.texturas_random != []):
		region_rect.position.x = DadosGlobal.texturas_random.pick_random()
