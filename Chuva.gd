extends CharacterBody2D

@export var speed = 300
@export var dano = 100

func _ready():
	velocity = Vector2.DOWN.rotated(rotation) * speed

func _physics_process(delta):
	move_and_slide()

func _on_area_2d_body_entered(body):
	queue_free()
