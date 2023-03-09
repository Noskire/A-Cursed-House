extends Control

var good_end_color = "#333333"
var bad_end_color = "#333333"
var neutral_end_color = "#333333"

func _ready():
	if Texts.good_endings == 5:
		BgMusic.melody = 1
		get_node("ColorRect").set_frame_color(Color(good_end_color))
		get_node("MarginContainer/VBox/Good").set_text("You purified all spirits.")
		get_node("MarginContainer/VBox/Bad").set_visible(false)
		get_node("MarginContainer/VBox/End").set_bbcode("[center]You get the [color=#4fb443]GOOD[/color] ending![/center]")
	elif Texts.bad_endings == 5:
		BgMusic.melody = 2
		get_node("ColorRect").set_frame_color(Color(bad_end_color))
		get_node("MarginContainer/VBox/Good").set_visible(false)
		get_node("MarginContainer/VBox/Bad").set_text("You exorcised all spirits.")
		get_node("MarginContainer/VBox/End").set_bbcode("[center]You get the [color=#de061a]BAD[/color] ending![/center]")
	else:
		BgMusic.melody = 0
		get_node("ColorRect").set_frame_color(Color(neutral_end_color))
		get_node("MarginContainer/VBox/Good").set_text("You purified " + str(Texts.good_endings) + " spirits.")
		get_node("MarginContainer/VBox/Bad").set_text("You exorcised " + str(Texts.bad_endings) + " spirits.")
		get_node("MarginContainer/VBox/End").set_bbcode("[center]You get the [color=#d9b42c]NEUTRAL[/color] ending![/center]")


func _on_Menu_button_up():
	BgMusic.melody = 0
	var err = get_tree().change_scene("res://MainMenu.tscn")
	if err != OK:
		print("Error: MainMenu change scene")
