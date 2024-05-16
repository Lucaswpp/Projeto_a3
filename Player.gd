extends KinematicBody2D


var gravidade = 1200
var velocidade = Vector2.ZERO
const jump_force = -400
var cont_jump = 0
var player_name = ResourceLoader.load("res://save_game/GameConfig.tres").duplicate()
var state_player = "run_" + player_name.personagem
var hit_player = false
var direction = 0
var speed = 4000
var life = 3

func _ready():
	position.x = 60
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
		
		
func _physics_process(delta):
	
	velocidade.y += delta * gravidade
	
	check_evento(delta)
	
	move_and_slide(velocidade,Vector2.UP)

func check_evento(delta):
	if not hit_player:
		jump_event()
		move_event(delta)

func _on_hurtBox_body_entered(body):
	var nome = body.name.split("_")[0]
	
	if nome == "Enemy" or nome == "@Enemy":
		hit_player = true
		$"anima".play("hit_"+player_name.personagem)
		velocidade.x += -10
		$"../Life".damage()


func _on_anima_animation_finished(anim_name):
	
	if anim_name == "hit_"+player_name.personagem:
		hit_player = false
		velocidade.x = 0

func move_event(delta):
	
	direction = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	velocidade.x = direction * speed * delta
