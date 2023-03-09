extends CanvasLayer

onready var player: KinematicBody2D = get_parent()
onready var but_op1: Button = get_node("Window/Margin/HBox/Op1")
onready var but_op2: Button = get_node("Window/Margin/HBox/Op2")
onready var but_op3: Button = get_node("Window/Margin/HBox/DoNothing")

func display(text_op1: String, text_op2: String):
	if text_op1 == "":
		but_op1.set_visible(false)
	else:
		but_op1.set_text(text_op1)
		but_op1.set_visible(true)
	
	if text_op2 == "":
		but_op2.set_visible(false)
	else:
		but_op2.set_text(text_op2)
		but_op2.set_visible(true)
	
	#but_op3.grab_focus()
	set_visible(true)

func _on_Op1_button_up():
	set_visible(false)
	player.speech_window.start_conversation(player.ghost.id, 2) # Good Ending
	player.talking = true
	Texts.good_endings += 1
	player.remaining_ghosts -= 1
	if player.ghost.id == 0: # Mother
		player.get_parent().get_node("Items/BedroomDirt").set_visible(false)
	elif player.ghost.id == 2: # Old brother
		player.reconciled_brothers = true

func _on_Op2_button_up():
	set_visible(false)
	player.speech_window.start_conversation(player.ghost.id, 3) # Bad Ending
	player.talking = true
	Texts.bad_endings += 1
	player.remaining_ghosts -= 1
	if player.ghost.id == 0: # Mother
		player.get_parent().get_node("Items/BedroomTrash").set_visible(true)
	elif player.ghost.id == 2: # Old brother
		player.brother_poisoned = true

func _on_DoNothing_button_up():
	set_visible(false)
	player.speech_window.set_visible(false)
	player.talking = false
