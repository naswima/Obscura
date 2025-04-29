extends Area2D
# Optional: Export a message or death logic
@export var death_message: String = "You died!"
@export var respawn_scene: PackedScene  # For respawn logic, if you want to load a scene again

# Called when a body (player) enters the area
func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		queue_free()
		print(death_message)  # Print the death message (or use a UI element)

		# Optional: Restart the level or reset player health (for demo purposes)
		if respawn_scene:
			get_tree().change_scene_to(respawn_scene)  # Load a scene again (can be the current scene)
		
		# You can also stop the player, play a sound, trigger animation, etc.
		# For example, let's stop the player movement and show a simple message:
		# body.queue_free()  # To remove the player (forcefully "death" it)
