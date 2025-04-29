extends Area2D

@export var item_name: String = "berry"
signal picked_up(item_name: String)  # Ensure the signal is defined with the parameter

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):  # Check if the body is the player
		print("Picked up:", item_name)
		emit_signal("picked_up", item_name)  # Emit the signal with the item name
		queue_free()  # Remove the item after it's picked up

@onready var area_shape = $CollisionShape2D
