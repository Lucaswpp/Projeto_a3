extends Control

var index = 0
onready var  lista_sprites = $"."

func togle_sprite(num):
	var cont = -1
	index = validate_pos(num)

	for i in lista_sprites.get_children():
		cont += 1
		
		if index == cont:
			i.visible = true
		else:
			i.visible = false

func get_select_idioma():
	var cont = -1
	for i in lista_sprites.get_children():
		cont += 1
		if i.visible == true:
			return i.name


func validate_pos(num):
	var pos_num = (index + num)
	
	if (num + index) < 0:
		pos_num = 2
		
	elif (num + index) > 2:
		pos_num = 0
	
	return pos_num


func _on_Button_pressed():
	togle_sprite(-1)


func _on_Button2_pressed():
	togle_sprite(1)
