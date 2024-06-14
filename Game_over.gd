extends Control


var idioma_mode = Tradutor.translate_game_path(Gameconfig.idioma+"."+"Game_over")
onready var texto = $"00"

func _ready():
	translate_game()

func _on_quit_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_replay_pressed():
	
	get_tree().change_scene("res://Nivel_1.tscn")

func translate_game():
	texto.text = idioma_mode[texto.name]
