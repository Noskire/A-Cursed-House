extends AudioStreamPlayer

onready var sfx_player: AudioStreamPlayer = get_node("SFX")

var neutral_music = load("res://assets/MusicBG.ogg")
var good_music = load("res://assets/GoodEnd.ogg")
var bad_music = load("res://assets/BadEnd.ogg")

var sfx = [load("res://assets/SFX/椅子を動かす1.mp3"),
			load("res://assets/SFX/窓をノック1.mp3"),
			load("res://assets/SFX/缶蹴り.mp3"),
			load("res://assets/SFX/賽銭を投げ入れる.mp3"),
			load("res://assets/SFX/鉄板を叩く2.mp3"),
			load("res://assets/SFX/鳩時計1.mp3")]

var melody = 0 # 0 - Neutral, 1 - Good, 2 - Bad

func _on_BGMusic_finished():
	if melody == 1:
		set_stream(good_music)
	elif melody == 2:
		set_stream(bad_music)
	else:
		set_stream(neutral_music)
	play()
