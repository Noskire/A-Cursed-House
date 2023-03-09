extends CanvasLayer

onready var player: KinematicBody2D = get_parent()
onready var label_character: RichTextLabel = get_node("Window/Margin/ColorBG/MarginC/Character")
onready var label_speech: RichTextLabel = get_node("Window/Margin/ColorBG/MarginS/Speech")

var character
var speech

var display_text_vel = .01
var f_displaying_text = false
var length
var rng = RandomNumberGenerator.new()
var ending = false
var good_end

func _ready():
	rng.randomize()

func start_conversation(id: int, text: int):
	character = Texts.actors[id]
	if text == 0:
		speech = Texts.intro[id]
	elif text == 1:
		var v = rng.randi_range(0, 2)
		speech = Texts.rand[id][v]
	elif text == 2:
		speech = Texts.good_end[id]
		ending = true
		good_end = true
	elif text == 3:
		speech = Texts.bad_end[id]
		ending = true
		good_end = false
	elif text == 4:
		speech = Texts.neutral_end
		ending = true
	
	label_character.set_bbcode(character + " " + Texts.family_name + ":")
	label_speech.set_visible_characters(0)
	set_visible(true)
	skip_text()

func start_info(text: String):
	label_character.set_bbcode("")
	speech = text
	label_speech.set_visible_characters(0)
	set_visible(true)
	skip_text()

func skip_text():
	if speech == "":
		# Close window
		set_visible(false)
		player.talking = false
		if ending:
			player.ghost_at_range = false
			player.ghost.die(good_end)
			ending = false
	elif speech.length() < Parameters.max_char:
		length = speech.length()
		label_speech.set_bbcode(speech)
		speech = ""
		display_text()
	else:
		var las_pos = speech.rfindn(" ", Parameters.max_char)
		length = las_pos + 1
		var chunk = speech.substr(0, length)
		speech = speech.substr(length)
		if chunk[length - 2] != "," and chunk[length - 2] != "." and chunk[length - 2] != "!":
			chunk += "..."
			length += 3
		label_speech.set_bbcode(chunk)
		display_text()

func display_text():
	f_displaying_text = true
	for l in length + 1:
		label_speech.set_visible_characters(l)
		yield(get_tree().create_timer(display_text_vel), "timeout")
		if not f_displaying_text:
			break
	f_displaying_text = false

func button_press():
	if f_displaying_text:
		label_speech.set_visible_characters(length)
		f_displaying_text = false
	else:
		skip_text()
