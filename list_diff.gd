extends Control

var index = 0
onready var lista_sprites = $"."


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
