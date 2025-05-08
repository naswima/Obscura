extends CharacterBody2D

@export var spawn_point: Marker2D
@onready var animated_sprite = $AnimatedSprite2D
@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

var pickedupitems: int = 0
@onready var pickup_area = $PickupArea  
var is_attacking: bool = false

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

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		die()

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO
	if velocity == Vector2.ZERO:
		print("Player velocity is zero.")

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

func _ready():
	add_to_group("player")

func die():
	print("Player died!")
	visible = false
	animated_sprite.stop()
	respawn()
	velocity = Vector2.ZERO
	visible = true
	animated_sprite.play("default")

func respawn():
	if spawn_point:
		global_position = spawn_point.global_position
		velocity = Vector2.ZERO
		move_and_slide()
	else:
		print("No spawn point set!")
