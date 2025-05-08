extends Area2D

@onready var player: Node2D = get_node("/root/Scene/Player")  # Adjust path to the player node

func _ready():
	connect("body_entered", Callable(self, "_on_body_entered"))

func _on_body_entered(body: Node2D):
	# Check if the overlapping body is in the "player" group
	if body.is_in_group("player"):
		body.respawn()
