extends Control

onready var idioma_list = $Hcontent/list_idioma
onready var diff_list = $Hcontent2/list_diff
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var obj_gameConfig = ResourceLoader.load(path_save+file_name).duplicate()
var mode_idioma = Tradutor.translate_game_path(obj_gameConfig.idioma+"."+"Config")
onready var label_titulo = $"00"
onready var label_idioma = $"Hcontent/01"
onready var label_diff = $"Hcontent2/02"

func _ready():
	label_titulo.text = mode_idioma[label_titulo.name]
	label_idioma.text = mode_idioma[label_idioma.name]
	label_diff.text = mode_idioma[label_diff.name]


func _on_Button5_pressed():
	obj_gameConfig.idioma = idioma_list.get_select_idioma()
	obj_gameConfig.diff = diff_list.get_select_diff()
	ResourceSaver.save(path_save+file_name,obj_gameConfig)
	get_tree().change_scene("res://Menu.tscn")
