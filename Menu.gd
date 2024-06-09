extends Control

var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var obj_config = ResourceLoader.load(path_save+file_name).duplicate()
var idioma_mode = Tradutor.translate_game_path(obj_config.idioma+"."+"Menu")

onready var lista_botao = $VBoxContainer

func _ready():
	translate_cena()

func _on_Start_pressed():
	get_tree().change_scene("res://Tutorial.tscn")


func _on_character_pressed():
	get_tree().change_scene("res://character.tscn")


func _on_score_pressed():
	get_tree().change_scene("res://Score.tscn")

func _on_exit_pressed():
	get_tree().quit()


func translate_cena():
	for i in lista_botao.get_children():
		i.text = idioma_mode[i.name]


func _on_Button_pressed():
	get_tree().change_scene("res://config.tscn")
