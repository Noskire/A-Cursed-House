extends Sprite

onready var beer = get_node("Cerveja")

var open = false
var has_beer = true

func get_item(player: KinematicBody2D):
	if not open:
		open = true
		set_region_rect(Rect2(96, 32, 32, 48))
		if has_beer:
			beer.set_visible(true)
	elif has_beer:
		player.has_beer = true
		player.speech_window.start_info("You took a can of beer!")
		player.talking = true
		player.item_at_range = false
		has_beer = false
		beer.set_visible(false)
	else:
		open = false
		set_region_rect(Rect2(64, 32, 32, 48))
