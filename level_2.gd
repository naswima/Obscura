extends Node2D

func _on_button_pressed() -> void:
	var main_scene = load("res://main.tscn")
	get_tree().change_scene_to_packed(main_scene)


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
