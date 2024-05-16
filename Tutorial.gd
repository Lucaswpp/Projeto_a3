extends Control

var tempo = 0
func _process(delta):
	
	tempo += delta
	
	if Input.is_action_just_pressed("enter"):
		get_tree().change_scene("res://Nivel_1.tscn")
