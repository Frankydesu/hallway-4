extends Control

func _ready():
	# Connect signals using unique names
	if has_node("%MainMenuButton"):
		%MainMenuButton.pressed.connect(_on_main_menu_pressed)

func _on_main_menu_pressed():
	# Change to the main menu scene
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
