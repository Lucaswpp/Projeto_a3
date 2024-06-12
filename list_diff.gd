extends Control

var index = 0
onready var lista_sprites = $"."
var path_save = "res://save_game/"
var file_name = "GameConfig.tres"
var obj_gameConfig = ResourceLoader.load(path_save+file_name).duplicate()

func _ready():
	charge_now_config()

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

func get_select_diff():
	var cont = -1
	for i in lista_sprites.get_children():
		cont += 1
		if i.visible == true:
			return i.name


func _on_Button3_pressed():
	togle_sprite(1)

func _on_Button4_pressed():
	togle_sprite(-1)

func charge_now_config():
	refresh_items()
	set_config()

func refresh_items():
	for i in lista_sprites.get_children():
		i.visible = false

func set_config():
	for i in lista_sprites.get_children():
		if i.name == obj_gameConfig.diff:
			i.visible = true
