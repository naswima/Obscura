extends Area2D

class_name MyPlayer

@export var item_name: String = "berry"
signal picked_up(item_name)

func _ready():
	print("Item ready")
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	print("Entered by:", MyPlayer)
	if body is MyPlayer:
		print("Picked up:", item_name)
		emit_signal("picked_up")
		queue_free()


@onready var area_shape = $CollisionShape2D
