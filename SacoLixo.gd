extends Sprite

func get_item(player: KinematicBody2D):
	player.has_trash = true
	player.speech_window.start_info("You took a garbage bag!")
	player.talking = true
	player.item_at_range = false
	queue_free()
