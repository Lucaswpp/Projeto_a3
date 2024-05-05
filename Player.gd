extends KinematicBody2D


var gravidade = 1200
var velocidade = Vector2.ZERO
const jump_force = -400
var cont_jump = 0
var player_name = ResourceLoader.load("res://save_game/GameConfig.tres").duplicate()
var state_player = "run_" + player_name.personagem


func _ready():
	position.x = 40
	position.y = 80

func jump_event():
	
	var is_jump_click = Input.is_action_just_pressed("JUMP")
	
	if is_on_floor():
		state_player = "run_" + player_name.personagem
		
		if is_jump_click:
			velocidade.y = jump_force
			state_player = "jump_" + player_name.personagem
			cont_jump += 1
		
		elif cont_jump > 0:
			cont_jump = 0
	
	else:
		if is_jump_click and cont_jump == 1:
			velocidade.y += jump_force / 2
			state_player = "d_jump_" + player_name.personagem
			cont_jump += 1
	
	$"anima".play(state_player)
	
	print(state_player)
		
		
func _physics_process(delta):
	
	print(cont_jump)
	velocidade.y += delta * gravidade
	
	check_evento()
	
	move_and_slide(velocidade,Vector2.UP)

func check_evento():
	jump_event()
