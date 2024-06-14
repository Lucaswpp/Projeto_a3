extends Control

onready var lista_sprites = $sprite_list
var index = 0
var idioma_mode = Tradutor.translate_game_path(Gameconfig.idioma+"."+"Character")
onready var texto = $"00"

func _ready():
	translate_game()

func _on_left_pressed():
	togle_sprite(-1)


func _on_right_pressed():
	togle_sprite(1)

func _on_Ok_pressed():
	Gameconfig.personagem = get_select_person()
	get_tree().change_scene("res://Menu.tscn")
	

func togle_sprite(num):
	var cont = -1
	index = validate_pos(num)

	for i in lista_sprites.get_children():
		cont += 1
		
		if index == cont:
			i.visible = true
		else:
			i.visible = false


func validate_pos(num):
	var pos_num = (index + num)
	
	if (num + index) < 0:
		pos_num = 2
		
	elif (num + index) > 2:
		pos_num = 0
	
	return pos_num

func get_select_person():
	var cont = -1
	for i in lista_sprites.get_children():
		cont += 1
		if i.visible == true:
			return i.name

func translate_game():
	texto.text = idioma_mode[texto.name]
	
