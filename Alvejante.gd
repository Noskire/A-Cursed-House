extends Sprite

func get_item(player: KinematicBody2D):
	player.has_bleach = true
	player.speech_window.start_info("You took a bleach!")
	player.talking = true
	queue_free()
