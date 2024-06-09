extends Control

onready var list_score = $scores
onready var list_sprites = $sprites
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var position_node_list: = [[128,80],[128,144],[128,208]]
var obj_gameConfig = ResourceLoader.load(path_save+file_name).duplicate()

func _on_exit_pressed():
	get_tree().change_scene("res://Menu.tscn")

func _ready():
	process_character_score()
	

func process_character_score():
	for i in list_score.get_children():
		i.text = ""+String(obj_gameConfig.scores[i.name])
