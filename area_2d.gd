extends Area2D

@export var spawn_point: Vector2  # Set the spawn point directly in the export variable

@onready var player: Node2D = get_node("/root/Scene/Player")  # Adjust path to the player node

func _ready():
	# Connect the body_entered signal to handle collisions
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	# Check if the overlapping body is in the "player" group
	if body.is_in_group("player"):
		body.global_position = spawn_point  # Reset the player's position to the spawn point
