extends Area2D

@export var fruitneeded := 51
@export var nextlevel: PackedScene

@onready var win_popup: Popup = $WinPopup  # This will refer to the WinPopup
@onready var player: Node2D = get_node("Player")  # Assuming Player is a direct child or has this path

var player_entered = false  # Flag to check if player entered portal after collecting fruits

func _ready():
	win_popup.hide()
	connect("body_entered", Callable(self, "_on_body_entered")) # Make sure WinPopup is hidden when the scene starts

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.pickedupitems < fruitneeded:
			# Show a message if not enough fruits are collected
			print("Not enough fruits!")
		else:
			# Mark that the player has entered the area and has collected enough items
			player_entered = true
			print("Player entered with enough fruits!")

func _on_portal_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and player_entered:
		win_popup.popup_centered()  # Show the WinPopup when the player enters the portal
		# Optionally, you can add a button in the popup to move to the next level:
		if nextlevel:
			get_tree().change_scene_to_file("res://end scene.tscn")
