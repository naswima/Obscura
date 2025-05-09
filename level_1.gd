extends Node2D

@onready var strawberry_sprite: Sprite2D = $Be
@onready var player_entered: bool = false
@onready var strawberry_picked: int = 0

@onready var music_player = $AudioStreamPlayer 

func _ready() -> void:
	print(strawberry_sprite)
	
func _process(delta: float) -> void:
	if player_entered:
		strawberry_sprite.visible = false
		strawberry_picked += 1

func _on_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!")
		strawberry_sprite.visible = false

func _on_area_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = false
		strawberry_sprite.visible = true
		print("Player exited area")

func _on_OKButton_pressed():
	$MissingFruitsPopup.hide()

func _on_missing_fruits_popup_close_requested() -> void:
	pass
