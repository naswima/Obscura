extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player": # Change to "Frog" if your player is called Frog!
		get_tree().reload_current_scene()
