extends Sprite

func get_item(player: KinematicBody2D):
	player.has_broom = true
	player.speech_window.start_info("You took a broom!")
	player.talking = true
	player.item_at_range = false
	queue_free()
