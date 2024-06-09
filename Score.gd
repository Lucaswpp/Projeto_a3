extends Control

onready var list_score = $scores
onready var list_sprites = $sprites
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var obj_gameconfig = ResourceLoader.load(path_save+file_name).duplicate()
var mode_idioma = Tradutor.translate_game_path(obj_gameconfig.idioma+"."+"Score")
var position_node_list: = [[128,80],[128,144],[128,208]]
onready var list_text = $HBoxContainer

func _on_exit_pressed():
	get_tree().change_scene("res://Menu.tscn")

func _ready():
	process_character_score()
	translate_game()
	

func process_character_score():
	for i in list_score.get_children():
		i.text = ""+String(obj_gameconfig.scores[i.name])

func translate_game():
	for i in list_text.get_children():
		i.text = mode_idioma[i.name]
