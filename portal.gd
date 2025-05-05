extends Area2D

@export var fruitneeded = 30 
@export var nextlevel : PackedScene


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.pickedupitems == fruitneeded:
			if nextlevel is PackedScene:
				get_tree().change_scene_to_packed(nextlevel)
			else:
				push_error("nextlevel is not a valid PackedScene!")
		else:
			print("Uh oh! 🍓 You need all the fruits before you can go! Looks like you're missing a few—go grab 'em and try again!")
