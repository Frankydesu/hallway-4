extends Node

@export var victory_door: Node3D # Drag your "Victory Way" here in Inspector
var keys_collected = 0
const REQUIRED_KEYS = 4

func _ready():
	victory_door.hide() # Make the exit invisible at start
	# Automatically find all keys in the scene and connect them
	var keys = get_tree().get_nodes_in_group("keys")
	for key in keys:
		if key.has_signal("key_collected"):
			key.key_collected.connect(_on_key_collected)

func _on_key_collected():
	print("Keys: ", keys_collected)
	keys_collected += 1
	if keys_collected >= REQUIRED_KEYS:
		victory_door.show()

func spawn_victory_way():
	print("Victory! The path is open.")
	victory_door.show()
	# You can add a sound effect or light here too!
	win_game()

func win_game():
	get_tree().change_scene_to_file("res://scenes/win_screen_vr.tscn")


func _on_xr_tools_pickable_key_collected() -> void:
	pass # Replace with function body.


func _on_xr_tools_pickable_2_key_collected() -> void:
	pass # Replace with function body.


func _on_xr_tools_pickable_3_key_collected() -> void:
	pass # Replace with function body.

func _on_xr_tools_pickable_4_key_collected() -> void:
	pass # Replace with function body.
