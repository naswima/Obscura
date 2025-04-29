extends CharacterBody2D


class_name Player

# Optional: the type or ID of the item
@export var berries: String = "berry"

signal picked_up(berry)

func _ready():
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body is Player:
		emit_signal("picked_up")
		queue_free()  # Removes the item from the scene
