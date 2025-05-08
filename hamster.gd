extends CharacterBody2D

@export var spawn_point: Marker2D 
@onready var animated_sprite = $AnimatedSprite2D 

var pickedupitems = 0
@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

var is_attacking: bool = false
var health: int = 100  

@onready var pickup_area = $PickupArea

func _on_item_picked_up(item_name: String) -> void:
	print("Picked up item:", item_name)

func _on_pickup_entered(body):
	if body.is_in_group("pickups"):
		print("Picked up: ", body.name)
		body.queue_free()

func update_animation(direction: Vector2) -> void:
	if is_attacking and not animated_sprite.is_playing():
		animated_sprite.play("attack")
	elif not is_on_floor() and not animated_sprite.is_playing():
		animated_sprite.play("jumping")
	elif direction.x != 0 and not animated_sprite.is_playing():
		animated_sprite.play("walking")
	elif direction.x == 0 and not animated_sprite.is_playing():
		animated_sprite.play("default")

func _on_animation_finished() -> void:
	if animated_sprite.animation == "attack":
		is_attacking = false

func _on_portal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://level 2.tscn")

func _physics_process(delta):
	var direction := Vector2.ZERO

	if not is_attacking:
		if Input.is_action_pressed("ui_right"):
			direction.x += 1
			animated_sprite.flip_h = false
		if Input.is_action_pressed("ui_left"):
			direction.x -= 1
			animated_sprite.flip_h = true

		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_velocity

		if not is_on_floor():
			velocity.y += gravity * delta

		if not is_attacking:
			velocity.x = direction.x * speed
			move_and_slide()
			update_animation(direction)

func die():
	print("Player has died.")
	queue_free()
	await get_tree().create_timer(2).timeout
	respawn()
	
func respawn():
	position = spawn_point.position
	health = 100
