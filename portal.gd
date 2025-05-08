extends Area2D

@export var fruitneeded := 30
@export var nextlevel: PackedScene

@onready var missing_fruits_popup : Popup = $MissingFruitsPopup
@onready var player : CharacterBody2D = $Player

func _ready():
	missing_fruits_popup.hide()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.pickedupitems < fruitneeded:
			missing_fruits_popup.popup_centered()
		else:
			get_tree().change_scene_to_packed(nextlevel)
