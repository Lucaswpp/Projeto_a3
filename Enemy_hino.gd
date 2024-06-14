extends KinematicBody2D

var speed = 20
var pos = Vector2.ZERO
const gravidade = 1200

func _ready():
	position.x = 480 + (480/2)
	position.y = 30
	
func _physics_process(delta):
	
	pos.x += speed*delta*-1
	pos.y += gravidade * delta
	
	move_and_slide(pos)
	queue_enemy()

func queue_enemy():
	if position.x <= -150:
		queue_free()
