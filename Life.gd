extends Node2D


var limit_damage = 3
var index = 0
var is_invuneravel = true
var time = 0
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var obj_gameConfig = ResourceLoader.load(path_save+file_name)


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
		obj_gameConfig.scores[obj_gameConfig.personagem] = int($"../score".text)
		ResourceSaver.save(path_save + file_name, obj_gameConfig)
		get_tree().change_scene("res://Game_over.tscn")
		

func invulneravel_time(delta):
	if is_invuneravel:
		time += delta
		if time >= 0.65:
			is_invuneravel = false
			time = 0
