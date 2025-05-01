extends Area2D

@export var fruitneeded = 10 
@export var nextlevel : PackedScene


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.pickedupitems == fruitneeded:
			get_tree().change_scene_to_packed(nextlevel)
