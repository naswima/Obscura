extends Area2D  # Not Area2D — use StaticBody2D to *block movement*

@onready var collision_shape = $CollisionShape2D
@onready var sprite: Sprite2D = $Sprite2D  # Optional, if you want to hide it visually too
@onready var player: CharacterBody2D = $"../mr_ frog"

func _ready():
	player = get_node_or_null("/root/level2/mr_frog")
	if player:
		player.fruit_count_updated.connect(_on_fruit_count_updated)
		_on_fruit_count_updated(player.fruit_count)  # check immediately in case count is already 50+
	else:
		print("Player not found!")

func _process(delta: float) -> void:
	if player:
		if player.pickedupitems >= 2:
			queue_free()

func _on_fruit_count_updated(new_count: int) -> void:
	if new_count >= 50:
		collision_shape.disabled = true
		if sprite:
			sprite.visible = false
	else:
		collision_shape.disabled = false  # <-- This line ensures it's blocking when under 50
