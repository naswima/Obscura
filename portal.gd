extends Area2D

@export var fruitneeded := 30
var next_level: PackedScene = load("res://level 2.tscn")

@onready var missing_fruits_popup: Popup = $MissingFruitsPopup

func _ready():
	missing_fruits_popup.hide()
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body):
	if body.is_in_group("player"):
		if "pickedupitems" in body and body.pickedupitems < fruitneeded:
			missing_fruits_popup.popup_centered()
		else:
			get_tree().change_scene_to_packed(next_level)
