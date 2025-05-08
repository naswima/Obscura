extends Node2D

@export var fruitname = "apples"
@onready var sprite = $AnimatedSprite2D

@export var pickup_range = 20
var player: Node = null

func _ready() -> void:
	sprite.play(fruitname)
	add_to_group("fruit")
	player = get_tree().get_first_node_in_group("player")

func _process(delta: float) -> void:
	if player and position.distance_to(player.position) <= pickup_range:
		player.pickedupitems += 1
		queue_free()
