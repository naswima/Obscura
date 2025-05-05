extends Node2D

func _on_button_pressed() -> void:
	var main_scene = load("res://main.tscn")
	get_tree().change_scene_to_packed(main_scene)
