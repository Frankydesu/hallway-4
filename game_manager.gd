extends Node

@export var victory_door: Node3D # Drag your "Victory Way" here in Inspector
var keys_found = 0
const TOTAL_KEYS = 4

func _ready():
	victory_door.hide() # Make the exit invisible at start

func on_key_collected():
	keys_found += 1
	print("Keys: ", keys_found)
	if keys_found >= TOTAL_KEYS:
		spawn_victory_way()

func spawn_victory_way():
	print("Victory! The path is open.")
	victory_door.show()
	# You can add a sound effect or light here too!


func _on_xr_tools_pickable_key_collected() -> void:
	pass # Replace with function body.


func _on_xr_tools_pickable_2_key_collected() -> void:
	pass # Replace with function body.


func _on_xr_tools_pickable_3_key_collected() -> void:
	pass # Replace with function body.

func _on_xr_tools_pickable_4_key_collected() -> void:
	pass # Replace with function body.
