extends Node2D

onready var ponto = $score
var time : int  =  0
onready var rino = load("res://Enemy_hino.tscn")
onready var bird = load("res://Enemy_bird.tscn")
onready var rabbit = load("res://Enemy_rabbit.tscn")
onready var chicken = load("res://Enemy_chicken.tscn")

#onready var capetao = load("res://Enemy_capetao.tscn")
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var game_objconfig = ResourceLoader.load(path_save+file_name).duplicate()
var tempo_spaw = 0
var num_random = RandomNumberGenerator.new()
onready var music_list = $music_list

func _ready():
	num_random.randomize()
	for i in music_list.get_children():
		if i.name == game_objconfig.diff:
			i.play()
	print(game_objconfig.dict_time_diff[game_objconfig.diff])
			
func _process(delta):
	tempo_spaw += delta
	if tempo_spaw > game_objconfig.dict_time_diff[game_objconfig.diff]:
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
	
	elif decisao >= 61 and decisao <= 70:
		return chicken
	
	elif decisao >= 71 and decisao <= 100:
		return rabbit
