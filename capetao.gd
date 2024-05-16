extends KinematicBody2D

var direction = -1
var speed = 10
var state = "idle_capetao"
onready var projetil = load("res://Enemy_projetil.tscn")
var time = 0

func _ready():
	position.x = 480 + (480/2)
	position.y = 90

func _physics_process(delta):
	main_loop(delta)

func full_charge_state():
	position.x += speed * direction

func check_pos():
	if position.x <= 240:
		state = "attack"

func _on_Timer_timeout():
	state = "overflow_capetao"

func main_loop(delta):
	
	check_pos()
	
	if state == "idle_capetao":
		full_charge_state()
	
	elif state == "attack":
		attack_capetao(delta)
	
	elif state == "capetao_overflow":
		overflow_capetao()

func overflow_capetao():
	
	position.x += speed * direction

func attack_capetao(delta):
	
	time += delta
	
	if time >= 2:
		time = 0
		$'.'.add_child(projetil.instance())
