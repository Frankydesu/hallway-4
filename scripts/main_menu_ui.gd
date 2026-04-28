extends Control

func _ready():
	# Connect signals using unique names if available
	if has_node("%StartButton"):
		%StartButton.pressed.connect(_on_start_pressed)
	if has_node("%OptionsButton"):
		%OptionsButton.pressed.connect(_on_options_pressed)
	if has_node("%QuitButton"):
		%QuitButton.pressed.connect(_on_quit_pressed)

func _on_start_pressed():
	# Change to the main game scene
	# Adjust the path if your main scene is named differently
	get_tree().change_scene_to_file("res://scene/main.tscn")

func _on_options_pressed():
	print("Options menu not implemented yet.")

func _on_quit_pressed():
	get_tree().quit()
