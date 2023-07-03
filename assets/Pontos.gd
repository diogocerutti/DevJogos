extends Label


func _ready():
	pass # Replace with function body.


func _process(delta):
	self.text = "Pontos: " + str(DadosGlobal.numero_pontos)
	
