extends Sprite

func get_item(player: KinematicBody2D):
	player.has_diary = true
	player.speech_window.start_info("\"Aeternus Somnus\"... Eternal sleep.")
	player.talking = true
