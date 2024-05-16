extends Control



func _on_Start_pressed():
	get_tree().change_scene("res://Tutorial.tscn")


func _on_character_pressed():
	get_tree().change_scene("res://character.tscn")


func _on_score_pressed():
	get_tree().change_scene("res://Score.tscn")

func _on_exit_pressed():
	get_tree().quit()
