extends Node2D


var limit_damage = 3
var index = 0
var is_invuneravel = true
var time = 0

func _process(delta):
	check_life()
	invulneravel_time(delta)
	
func damage():
	
	if is_invuneravel:
		return
	$".".get_children()[index].visible = false
	index += 1
	is_invuneravel = true
	

func check_life():
	
	if index > 2:
		get_tree().change_scene("res://Game_over.tscn")
		

func invulneravel_time(delta):
	if is_invuneravel:
		time += delta
		if time >= 1.2:
			is_invuneravel = false
			time = 0
