extends Node2D

onready var ponto = $score
var time : int  =  0

func _process(delta):
	
	time += delta * 100
	ponto.text = ""+String(time)
