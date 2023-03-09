extends Node

var max_char = 250

var master_vol = 0.0
var music_vol = -12.0
var sfx_vol = -12.0
var voice_vol = -12.0

func _ready():
	update_vol(0, master_vol)
	update_vol(1, music_vol)
	update_vol(2, sfx_vol)
	update_vol(3, voice_vol)

func update_vol(idx, vol):
	if vol == -25:
		AudioServer.set_bus_mute(idx, true)
	else:
		AudioServer.set_bus_volume_db(idx, vol)
		AudioServer.set_bus_mute(idx, false)
	
	if idx == 0:
		master_vol = vol
	elif idx == 1:
		music_vol = vol
	elif idx == 2:
		sfx_vol = vol
	elif idx == 3:
		voice_vol = vol
