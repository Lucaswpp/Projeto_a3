extends KinematicBody2D

var speed = 10
var veloc = Vector2.ZERO
onready var player = get_node("../Player")
var state = "idle"
var distancia_x = 0
var distancia_y = 0
const height_screen = 288
var distancia = 0
var time = 3
var cont = 0
var d_y = 1

func _ready():
	position.y = 40
	position.x =  480 + (480/2)
	distancia_y = height_screen - position.y
	
	
func _physics_process(delta):
	if state == "idle":
		idle_mode(delta)
	elif state == "attack":
		attack_mode(delta)


	check_distancia_x()
	
	veloc.normalized()
	move_and_slide(veloc)

func check_distancia_x():
	distancia_x = ((player.position.x - position.x)*-1)
	if  distancia_x <=  300:
		state = "attack"
		calc_hipotenusa()
		calc_speed()
		

func idle_mode(delta):
	veloc.x += speed * delta * -1
	

func attack_mode(delta):
	
	cont += delta
	
	veloc.x += (speed * -1 * delta)
	veloc.y += (speed * delta) * d_y
	
	if cont >= 1.7:
		veloc.y = -300
		d_y = -1
	
func calc_hipotenusa():
	var soma_catetos = (distancia_x * distancia_x) + (distancia_y * distancia_y)
	distancia = sqrt(soma_catetos)

func calc_speed():
	speed = (distancia/time)
