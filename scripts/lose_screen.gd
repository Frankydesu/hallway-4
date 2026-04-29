extends Control

func _ready():
	# Connect signals using unique names
	if has_node("%ReplayButton"):
		%ReplayButton.pressed.connect(_on_replay_pressed)
		%ReplayButton.mouse_entered.connect(_on_button_hover.bind(%ReplayButton))
		%ReplayButton.mouse_exited.connect(_on_button_unhover.bind(%ReplayButton))
		
	if has_node("%MainMenuButton"):
		%MainMenuButton.pressed.connect(_on_main_menu_pressed)
		%MainMenuButton.mouse_entered.connect(_on_button_hover.bind(%MainMenuButton))
		%MainMenuButton.mouse_exited.connect(_on_button_unhover.bind(%MainMenuButton))

func _on_button_hover(button: Button):
	var tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1.05, 1.05), 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)

func _on_button_unhover(button: Button):
	var tween = create_tween()
	tween.tween_property(button, "scale", Vector2(1.0, 1.0), 0.1).set_trans(Tween.TRANS_QUAD).set_ease(Tween.EASE_OUT)


func _on_replay_pressed():
	# Change back to the main game scene
	get_tree().change_scene_to_file("res://scene/main.tscn")

func _on_main_menu_pressed():
	# Change back to the main menu scene
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
