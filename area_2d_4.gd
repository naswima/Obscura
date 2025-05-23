extends Area2D

@export var item_name: String = "berry"
signal picked_up(item_name: String)  # Ensure the signal is defined with the parameter

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		print("Picked up:", item_name)
		emit_signal("picked_up", item_name)  # Pass item_name when emitting the signal
		queue_free()



@onready var area_shape = $CollisionShape2D
