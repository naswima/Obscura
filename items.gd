extends Node2D

@export var fruitname = "apples"

func _ready() -> void:
	$AnimatedSprite2D.play(fruitname)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		if body.has_method("pickedupitems"):  
			body.pickedupitems += 1
			queue_free()
