extends Sprite2D

func _ready():
	region_rect.position.x = DadosGlobal.texturas_random.pick_random()
