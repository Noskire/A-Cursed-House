extends KinematicBody2D

onready var player: KinematicBody2D = get_parent().get_node("Player")
onready var sprite: Sprite = get_node("Sprite")
onready var anim: AnimationPlayer = get_node("AnimationPlayer")

export var id = 0 # 0 - Mother, 1 - Father, 2 - Older brother, 3 - Younger brother, 4 - Sister
export var visible_range = 100.0

var text = 0 # 0 - Intro, 1 - Rand, 2 - Good end, 3 - Bad end - 4 Neutral end

func _ready():
	sprite.set_modulate(Color(Texts.colors[id]))
	sprite.frame_coords.y = id

func _process(_delta):
	if player != null:
		var dist = (player.position - get_global_position()).length()
		var alpha
		if dist > visible_range:
			alpha = 0
		else:
			alpha = 1 - (dist / visible_range)
		sprite.modulate.a = alpha

func die(good_end: bool):
	if id == 4:
		var err = get_tree().change_scene("res://EndGame.tscn")
		if err != OK:
			print("Error: EndGame change scene")
	else:
		if good_end:
			anim.play("Purify")
		else:
			anim.play("Exorcy")
