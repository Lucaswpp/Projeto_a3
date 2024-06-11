extends KinematicBody2D

var veloc = Vector2.ZERO
var speed = 60
onready var root_node = get_parent()
var cont_flip = 0
var is_reverse = -1
var gravidade = 1200
var is_flip = false


func _ready():
	position.x = 480 + (480/2)
	position.y = 30

func _physics_process(delta):
	check_event()
	
	if is_flip:
		flip()
	
	veloc.x += speed * is_reverse * delta
	veloc.y += gravidade * delta
	
	move_and_slide(veloc)
	
	
func check_event():
	position_event()

func position_event():
	var distancia = position.x - root_node.position.x
	
	if (distancia < 30 and cont_flip <= 0) or (distancia > 450 and cont_flip == 1):
		is_flip = true

func flip():
	
	if cont_flip == 0:
		is_reverse = 1
	elif cont_flip == 1:
		is_reverse = -1
		
	veloc.x = 70 * is_reverse
	$Sprite.flip_h = not $Sprite.flip_h
	cont_flip += 1
	is_flip = false
