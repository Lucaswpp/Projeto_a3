extends KinematicBody2D

var veloc = Vector2.ZERO
var state = "rabbit_idle"
var direction = -1
var gravidade = 1200
var jump_force = -600
onready var anima = $AnimationPlayer
var speed = 4000

func _ready():
	position.x = 480 + (480/2)
	position.y = 30
	
func _physics_process(delta):
	
	veloc.y += delta * gravidade
	veloc.x = delta * speed * direction
	
	jump_state()
	
	move_and_slide(veloc,Vector2.UP)
	
	queue_enemy()


func jump_state():
	
	state = "rabbit_idle"
	
	if is_on_floor():
		jump()
	
	else:
		state = "rabbit_jump"
		if veloc.y < 0:
			state = "rabit_fall"
			
	
	anima.play(state)

func jump():
	veloc.y = jump_force

func queue_enemy():
	if position.x <= -150:
		queue_free()
