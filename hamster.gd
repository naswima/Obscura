extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Vector2.ZERO

	# Handle horizontal input
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		animated_sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		animated_sprite.flip_h = true

	# Handle jumping (ONLY if on floor)
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		velocity.y = 0.0

	# Horizontal velocity
	velocity.x = direction.x * speed

	# Move and slide
	move_and_slide()

	# Play default animation
	if not animated_sprite.is_playing():
		animated_sprite.play("default")

func _on_portal_body_entered(body: Node2D) -> void:
	if body == self:
		get_tree().change_scene_to_file("res://level 2.tscn")
