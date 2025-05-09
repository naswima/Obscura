extends Area2D

@onready var collision_shape = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D
@onready var player: CharacterBody2D = get_node_or_null("/root/level2/mr_frog")
@onready var missing_fruits_popup: Popup = $MissingFruitsPopup

@export var fruitneeded := 50

func _ready():
	missing_fruits_popup.hide()
	connect("body_entered", Callable(self, "_on_body_entered"))

func _process(delta: float) -> void:
	if player and player.pickedupitems >= 50:
		queue_free()

func _on_body_entered(body):
	print("Body entered:", body)
	if body.is_in_group("player"):
		if "pickedupitems" in body and body.pickedupitems < fruitneeded:
			missing_fruits_popup.popup_centered()
		else:
			get_tree().change_scene_to_file("res://main.tscn")
