extends Node2D

@export var speed = 0.01
func _process(delta: float) -> void:
	rotate(speed)
