extends RigidBody2D

signal clicked

var held = false
@export var quadradoIn = false
@export var trianguloIn = false
@export var circuloIn = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			clicked.emit(self)

func _physics_process(delta):
	if held:
		global_transform.origin = get_global_mouse_position()

func pickup():
	if held:
		return
	freeze = true
	held = true
	
func drop(impulse=Vector2.ZERO):
	if held:
		freeze = false
		apply_central_impulse(impulse)
		held = false
		
func _on_area_vermelha_body_entered(body):
	if body.name == "Quadrado":
		quadradoIn = true
		
func _on_area_vermelha_body_exited(body):
	if body.name == "Quadrado":
		quadradoIn = false

func _on_area_azul_body_entered(body):
	if body.name == "Triangulo":
		trianguloIn = true

func _on_area_azul_body_exited(body):
	if body.name == "Triangulo":
		trianguloIn = false

func _on_area_verde_body_entered(body):
	if body.name == "Circulo":
		circuloIn = true

func _on_area_verde_body_exited(body):
	if body.name == "Circulo":
		circuloIn = false
