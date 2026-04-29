extends XRToolsPickable
#
#signal key_collected
#
## This function is called when the item is "collected"
#func collect():
	#key_collected.emit()
	#queue_free() # Remove the key from the world
#
#func _on_picked_up(_pickable):
	#collect()
