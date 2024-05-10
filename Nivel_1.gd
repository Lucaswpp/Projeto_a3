extends Node2D

onready var ponto = $score
var time : int  =  0
onready var rino = load("res://Enemy_hino.tscn")
onready var bird = load("res://Enemy_bird.tscn")
var tempo_spaw = 0
var num_random = RandomNumberGenerator.new()

func _process(delta):
	
	tempo_spaw += delta
	
	if tempo_spaw > 3:
		tempo_spaw = 0
		var obj_enemy = select_random_enemy()
		$".".add_child(obj_enemy.instance())
		
	time += delta * 100
	ponto.text = ""+String(time)

func select_random_enemy():
	var decisao: bool = num_random.randi_range(1,100) > 50
	
	if decisao:
		return rino
	
	else:
		return bird
