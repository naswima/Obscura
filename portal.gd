extends Area2D

@export var fruitneeded = 30 
@export var nextlevel : PackedScene


@onready var missing_fruits_popup = $MissingFruitsPopup

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		# Ensure the 'pickedupitems' exists and is properly initialized
		if body.has_method("pickedupitems") and body.pickedupitems == fruitneeded:
			if nextlevel:  # Check if nextlevel is assigned
				get_tree().change_scene_to_packed(nextlevel)
			else:
				push_error("nextlevel is not a valid PackedScene!")
		else:
			missing_fruits_popup.popup_centered()
