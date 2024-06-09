extends Control

var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var obj_config = ResourceLoader.load(path_save+file_name).duplicate()
var idioma_mode = Tradutor.translate_game_path(obj_config.idioma+"."+"Game_over")
onready var texto = $"00"

func _ready():
	translate_game()

func _on_quit_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_replay_pressed():
	
	get_tree().change_scene("res://Nivel_1.tscn")

func translate_game():
	texto.text = idioma_mode[texto.name]
