extends Control


var idioma_mode = Tradutor.translate_game_path(Gameconfig.idioma+"."+"Tutorial")
onready var texto = $"00"
onready var texto2 = $"01"
var tempo = 0

func _ready():
	translate_game()
	
func _process(delta):
	
	tempo += delta
	
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene("res://Nivel_1.tscn")

func translate_game():
	texto.text = idioma_mode[texto.name]
	texto2.text = idioma_mode[texto2.name]
