extends Control



func _on_Start_pressed():
	get_tree().change_scene("res://Nivel_1.tscn")


func _on_character_pressed():
	get_tree().change_scene("res://character.tscn")


func _on_score_pressed():
	pass



func _on_exit_pressed():
	get_tree().quit()
