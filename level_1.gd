class_name Level1
extends Node2D

@onready var be: Sprite2D = $Be
@onready var missing_fruits_popup = $MissingFruitsPopup

var player_entered = false
var strawberry_picked = 0
const REQUIRED_FRUITS = 4  # Change this based on your level

func _ready() -> void:
	print(be)

func _process(delta: float) -> void:
	if player_entered:
		be.visible = false
		strawberry_picked += 1
		player_entered = false  # Reset to avoid repeated increment

# Called when the player exits a fruit area
func _on_area_body_exited(body: Node2D, area_id: int) -> void:
	if body.is_in_group("player"):
		be.visible = true
		print("Player exited area %d" % area_id)

# Fruit pickup triggers
func _on_area_2d_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!")

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!") 

func _on_area_2d_4_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!") 

func _on_area_2d_5_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!") 

# Called when the player enters the portal area
func _on_portal_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if strawberry_picked < REQUIRED_FRUITS:
			missing_fruits_popup.popup_centered()
		else:
			print("You can proceed to the next level!")

@onready var music_player = $AudioStreamPlayer

func _readyy():
	var music_stream = load("res://ELEVATOR (LOOP).mp3")
	if music_stream is AudioStream:
			music_stream.loop = true
			music_player.stream = music_stream
			music_player.play()
