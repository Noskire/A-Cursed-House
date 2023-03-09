extends Node2D

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	
	yield(get_tree().create_timer(12.0), "timeout")
	play_sfx()

func play_sfx():
	var id = rng.randi_range(0, 5)
	BgMusic.sfx_player.set_stream(BgMusic.sfx[id])
	BgMusic.sfx_player.play()
	
	var time = rng.randf_range(12.0, 18.0)
	yield(get_tree().create_timer(time), "timeout")
	play_sfx()
