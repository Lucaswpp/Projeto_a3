extends Control

onready var idioma_list = $Hcontent/list_idioma
onready var diff_list = $Hcontent2/list_diff
var mode_idioma = Tradutor.translate_game_path(Gameconfig.idioma+"."+"Config")
onready var label_titulo = $"00"
onready var label_idioma = $"Hcontent/01"
onready var label_diff = $"Hcontent2/02"

func _ready():
	translate_cena()
	

func _on_Button5_pressed():
	Gameconfig.idioma = idioma_list.get_select_idioma()
	Gameconfig.diff = diff_list.get_select_diff()
	get_tree().change_scene("res://Menu.tscn")

func translate_cena():
	label_titulo.text = mode_idioma[label_titulo.name]
	label_idioma.text = mode_idioma[label_idioma.name]
	label_diff.text = mode_idioma[label_diff.name]
