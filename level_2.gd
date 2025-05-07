extends Node2D

var player_entered = false

func _on_button_pressed() -> void:
	var main_scene = load("res://main.tscn")
	get_tree().change_scene_to_packed(main_scene)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!")
	


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


@onready var congrats_dialog = $CanvasLayer/CongratsDialog

func _ready():
	show_congrats_message()

func show_congrats_message():
	congrats_dialog.dialog_text = "Woohoo! You picked every last fruity treat—so proud of you! 🍓🍊 You win!"
	congrats_dialog.popup_centered()
	congrats_dialog.confirmed.connect(_on_dialog_confirmed)

func _on_dialog_confirmed():
	get_tree().change_scene_to_file("res://main.tscn")
