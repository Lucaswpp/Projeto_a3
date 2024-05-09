extends Node2D

onready var ponto = $score
var time : int  =  0
onready var rino = load("res://Enemy_hino.tscn")
var tempo_spaw = 0

func _process(delta):
	
	tempo_spaw += delta
	
	if tempo_spaw > 3:
		tempo_spaw = 0
		var rino_obj = rino.instance()
		$".".add_child(rino_obj)
		
	time += delta * 100
	ponto.text = ""+String(time)
