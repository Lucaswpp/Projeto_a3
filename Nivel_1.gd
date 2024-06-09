extends Node2D

onready var ponto = $score
var time : int  =  0
onready var rino = load("res://Enemy_hino.tscn")
onready var bird = load("res://Enemy_bird.tscn")
onready var rabbit = load("res://Enemy_rabbit.tscn")
onready var capetao = load("res://Enemy_capetao.tscn")
var tempo_spaw = 0
var num_random = RandomNumberGenerator.new()

func _process(delta):
	tempo_spaw += delta
	
	if tempo_spaw > 1.2:
		tempo_spaw = 0
		var obj_enemy = select_random_enemy()
		$".".add_child(obj_enemy.instance())
		
	time += delta * 100
	ponto.text = ""+String(time)

func select_random_enemy():
	var decisao = num_random.randi_range(1,100)
	
	
	if decisao >= 1 and decisao <= 30:
		return bird
	
	elif decisao >= 31 and decisao <= 60:
		return rino
	
	elif decisao >= 61 and decisao <= 100:
		return rabbit
