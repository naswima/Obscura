class_name Level1 extends Node2D
@onready var be: Sprite2D = $Be
@onready var player_entered = false
@onready var strawberry_picked = 0

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if player_entered == true:
		be.visible = false
		strawberry_picked +=1


func _on_area_2d_2_body_entered(body: Node2D) -> void:

	player_entered = true
	print("Item picked up!")  # Replace with function body.


func _on_area_2d_2_body_exited(body: Node2D) -> void:
	player_entered = true  # Replace with function body.
