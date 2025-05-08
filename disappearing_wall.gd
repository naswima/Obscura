extends Area2D  # Or StaticBody2D, depending on your setup

@onready var collision_shape = $CollisionShape2D  # Access the collision shape

func _ready():
	var player = get_node("/root/level2/mr_frog")  # Adjust this path to the actual player node in Level 2
	if player:
		player.fruit_count_updated.connect(_on_fruit_count_updated)

func _on_fruit_count_updated(new_count: int) -> void:
	if new_count >= 50:
		collision_shape.disabled = true  # Disables the collision
		self.visible = false             # Hides the wall (optional)
		set_process(false)               # Stops checking once the condition is met
