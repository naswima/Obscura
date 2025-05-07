class_name Level1 extends Node2D
@onready var be: Sprite2D = $Be
@onready var player_entered = false
@onready var strawberry_picked = 0

func _ready() -> void:
	print(be)
	
func _process(delta: float) -> void:
	if player_entered == true:
		be.visible = false
		strawberry_picked +=1
		
func _on_area_body_exited(body: Node2D, area_id: int) -> void:
	if body.is_in_group("player"):
		player_entered = false
		be.visible = true  # Make the sprite visible again
		print("Player exited area %d" % area_id)

func _on_area_2d_2_body_entered(body: Node2D) -> void:
	player_entered = true
	print("Item picked up!")  # Replace with function body.


func _on_area_2d_2_body_exited(body: Node2D) -> void:
	player_entered = false  # Replace with function body.


func _on_area_2d_3_body_entered(body: Node2D) -> void:
	player_entered = true
	print("Item picked up!") 

func _on_area_2d_3_body_exited(body: Node2D) -> void:
	player_entered = false

func _on_area_2d_4_body_entered(body: Node2D) -> void:
	player_entered = true
	print("Item picked up!") 

func _on_area_2d_4_body_exited(body: Node2D) -> void:
	player_entered = false

func _on_area_2d_5_body_entered(body: Node2D) -> void:
	player_entered = true
	print("Item picked up!") 

func _on_area_2d_5_body_exited(body: Node2D) -> void:
	player_entered = false


func _on_OKButton_pressed():
	$MissingFruitsPopup.hide()
