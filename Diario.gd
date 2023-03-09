extends Sprite

func get_item(player: KinematicBody2D):
	player.has_diary = true
	player.speech_window.start_info("You took " + Texts.actors[3] + "'s diary!")
	player.talking = true
	player.item_at_range = false
	queue_free()
