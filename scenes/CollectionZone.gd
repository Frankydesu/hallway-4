extends Area3D

@export var door_to_reveal: Node3D # Drag your door/victory way here
@export var required_keys: int = 4

var keys_inside: int = 0
var not_keys_inside: int = 0

func _ready():
	# Hide the door at the start
	if door_to_reveal:
		door_to_reveal.hide()
	
	# Connect the signals for when something enters or leaves the zone
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body):
	# Ignore anything that isn't a pickable object (like the floor or your hands)
	if not body is XRToolsPickable:
		return 

	print("Pickable item entered: ", body.name)
	
	if body.is_in_group("keys"):
		print("Key confirmed!")
		keys_inside += 1
	else:
		print("Junk confirmed!")
		not_keys_inside += 1
			
	check_victory()

func _on_body_exited(body):
	if not body is XRToolsPickable:
		return

	if body.is_in_group("keys"):
		keys_inside -= 1
	else:
		not_keys_inside -= 1
		
	check_victory()

func check_victory():
	print("Keys in zone: ", keys_inside)
	print("keys_inside", keys_inside)
	print("not_keys_inside", not_keys_inside)
	if keys_inside >= required_keys and not_keys_inside == 0:
		if door_to_reveal:
			door_to_reveal.show()
	else:
		if door_to_reveal:
			door_to_reveal.hide() # Hide it again if they remove a key
