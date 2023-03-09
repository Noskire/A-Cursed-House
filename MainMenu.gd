extends Control

func _on_NewGame_button_up():
	var err = get_tree().change_scene("res://House.tscn")
	if err != OK:
		print("Error: NewGame change scene")

func _on_Options_button_up():
	var err = get_tree().change_scene("res://OptionsMenu.tscn")
	if err != OK:
		print("Error: OptionMenu change scene")
