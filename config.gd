extends Control

onready var idioma_list = $list_idioma
onready var diff_list = $list_diff
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
onready var obj_gameConfig = ResourceLoader.load(path_save+file_name).duplicate()

func _on_Button5_pressed():
	obj_gameConfig.idioma = idioma_list.get_select_idioma()
	obj_gameConfig.diff = diff_list.get_select_diff()
	ResourceSaver.save(path_save+file_name,obj_gameConfig)
	get_tree().change_scene("res://Menu.tscn")
