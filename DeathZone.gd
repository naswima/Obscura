extends Area2D
@export var spawn_point: Marker2D
var velocity: Vector2 = Vector2.ZERO

func _ready():
	connect("body_entered", Callable(self, "_on_death_zone_body_entered"))

func _on_body_entered(body: Node2D) -> void:
	print("Entered:", body.name)
	if body.is_in_group("player") and body.has_method("respawn"):
		print("Calling respawn on", body.name)
		velocity = Vector2.ZERO
		body.die() 
		body.respawn()  
