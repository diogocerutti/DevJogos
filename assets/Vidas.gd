extends Label


func _ready():
	pass # Replace with function body.


func _process(delta):
	self.text = "Vidas: " + str(DadosGlobal.numero_vidas)
	
