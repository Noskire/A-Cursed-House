extends Control

onready var masterValue: Label = get_node("Margin/Grid/Master/Value")
onready var masterSlider: HSlider = get_node("Margin/Grid/Master/Slider")
onready var musicValue: Label = get_node("Margin/Grid/Music/Value")
onready var musicSlider: HSlider = get_node("Margin/Grid/Music/Slider")
onready var sfxValue: Label = get_node("Margin/Grid/SFX/Value")
onready var sfxSlider: HSlider = get_node("Margin/Grid/SFX/Slider")
onready var voiceValue: Label = get_node("Margin/Grid/Voice/Value")
onready var voiceSlider: HSlider = get_node("Margin/Grid/Voice/Slider")

func _ready():
	var value = Parameters.master_vol
	masterSlider.value = value
	masterValue.text = str(int((25 + value) * 4))
	value = Parameters.music_vol
	musicSlider.value = value
	musicValue.text = str(int((25 + value) * 4))
	value = Parameters.sfx_vol
	sfxSlider.value = value
	sfxValue.text = str(int((25 + value) * 4))
	value = Parameters.voice_vol
	voiceSlider.value = value
	voiceValue.text = str(int((25 + value) * 4))

func _on_DisplayBtn_item_selected(index):
	if index == 1:
		OS.window_fullscreen = true
	else:
		OS.window_fullscreen = false

func _on_LanguageBtn_item_selected(index):
	if index == 1:
		TranslationServer.set_locale("en")
		#Save.game_data.language = "en"
	elif index == 2:
		TranslationServer.set_locale("pt")
		#Save.game_data.language = "pt"
	#Save.save_data()
	var err = get_tree().reload_current_scene()
	if err != OK:
		print("Error: OptionsMenu reload current scene")

func _on_FontBtn_item_selected(index):
	var font = get_font("font", "")
	if index == 0:
		font.size = 48
		Parameters.max_char = 230
	elif index == 1:
		font.size = 60
		Parameters.max_char = 170
	else:
		font.size = 72
		Parameters.max_char = 110

func _on_Master_value_changed(value):
	Parameters.update_vol(0, value)
	masterValue.text = str(int((25 + value) * 4))

func _on_Music_value_changed(value):
	Parameters.update_vol(1, value)
	musicValue.text = str(int((25 + value) * 4))

func _on_SFX_value_changed(value):
	Parameters.update_vol(2, value)
	sfxValue.text = str(int((25 + value) * 4))

func _on_Voice_value_changed(value):
	Parameters.update_vol(3, value)
	voiceValue.text = str(int((25 + value) * 4))

func _on_Back_button_up():
	var err = get_tree().change_scene("res://MainMenu.tscn")
	if err != OK:
		print("Error: MainMenu change scene")
