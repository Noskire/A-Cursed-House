extends KinematicBody2D

onready var speech_window: CanvasLayer = get_node("SpeechWindow")
onready var options_window: CanvasLayer = get_node("Options")
onready var sprite: Sprite = get_node("Sprite")
onready var collision: CollisionShape2D = get_node("Collision")
onready var light: Light2D = get_node("Light2D")
onready var camera: Camera2D = get_node("Camera2D")
onready var anim: AnimationPlayer = get_node("AnimationPlayer")

export var player_speed = 100.0

var velocity
var ghost_at_range = false
var ghost
var item_at_range = false
var item
var talking = false
var text_op1
var text_op2

var has_trash = false
var has_broom = false
var has_beer = false
var has_diary = false
var has_bleach = false
var reconciled_brothers = false
var brother_poisoned = false
var remaining_ghosts = 5

func _physics_process(_delta: float) -> void:
	if not talking:
		# Get direction and move
		velocity = get_direction() * player_speed
		velocity = move_and_slide(velocity)
		
		if Input.is_action_just_pressed("action"):
			if ghost_at_range:
				if ghost.text == 0:
					speech_window.start_conversation(ghost.id, ghost.text)
					ghost.text = 1
					talking = true
				else:
					if ghost.id == 0: # Mother
						if has_broom || has_trash:
							speech_window.start_info("What do you want to do?")
							text_op1 = "Sweep the room" if has_broom else ""
							text_op2 = "Throw garbage in the room" if has_trash else ""
							options_window.display(text_op1, text_op2)
						else:
							speech_window.start_conversation(ghost.id, ghost.text)
						talking = true
					elif ghost.id == 1: # Father
						if brother_poisoned:
							speech_window.start_conversation(ghost.id, 3) # Bad ending
							Texts.bad_endings += 1
							remaining_ghosts -= 1
						elif has_beer:
							speech_window.start_info("What do you want to do?")
							text_op1 = "Give the beer can"
							text_op2 = ""
							options_window.display(text_op1, text_op2)
						else:
							speech_window.start_conversation(ghost.id, ghost.text)
						talking = true
					elif ghost.id == 2: # Old Brother
						if has_diary || has_bleach:
							speech_window.start_info("What do you want to do?")
							text_op1 = "Give the diary" if has_diary else ""
							text_op2 = "Give the bleach" if has_bleach else ""
							options_window.display(text_op1, text_op2)
						else:
							speech_window.start_conversation(ghost.id, ghost.text)
						talking = true
					elif ghost.id == 3: # Young Brother
						if reconciled_brothers:
							speech_window.start_conversation(ghost.id, 2) # Good ending
							Texts.good_endings += 1
							remaining_ghosts -= 1
						elif brother_poisoned:
							speech_window.start_conversation(ghost.id, 3) # Bad ending
							Texts.bad_endings += 1
							remaining_ghosts -= 1
						else:
							speech_window.start_conversation(ghost.id, ghost.text)
						talking = true
					elif ghost.id == 4: # Sister
						if remaining_ghosts == 1:
							if Texts.good_endings == 4:
								speech_window.start_conversation(ghost.id, 2) # Good ending
								Texts.good_endings += 1
							elif Texts.bad_endings == 4:
								speech_window.start_conversation(ghost.id, 3) # Bad ending
								Texts.bad_endings += 1
							else:
								speech_window.start_conversation(ghost.id, 4) # Neutral ending
								Texts.bad_endings += 1
						else:
							speech_window.start_conversation(ghost.id, ghost.text)
						talking = true
			if item_at_range:
				item.get_item(self)
	else:
		if Input.is_action_just_pressed("action"):
			speech_window.button_press()

func get_direction() -> Vector2:
	# Get player input
	var direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	
	# Animation
	if abs(direction.x) > 0 or abs(direction.y) > 0:
		anim.play("Move")
	else:
		anim.play("Idle")
	
	# Sprite direction
	if direction.x > 0:
		sprite.scale.x = 1
	elif direction.x < 0:
		sprite.scale.x = -1
	
	return direction.normalized()

func _on_Area2D_body_entered(body):
	ghost_at_range = true
	ghost = body

func _on_Area2D_body_exited(_body):
	ghost_at_range = false

func _on_Area2D_area_entered(area):
	item_at_range = true
	item = area.get_parent()

func _on_Area2D_area_exited(_area):
	item_at_range = false
