# Player.gd
class_name frog
extends CharacterBody2D

@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

@onready var animated_sprite = $AnimatedSprite2D  # Make sure this exists in the scene

func _physics_process(delta):
	var direction = 0.0

	# Handle horizontal input
	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	velocity.x = direction * speed

	# Gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_velocity

	# Move the character
	move_and_slide()  # <- No arguments!

	# Handle animation
	update_animation(direction)

func update_animation(direction: float) -> void:
	if not is_on_floor():
		# animated_sprite.play("jump")  # optional
		pass
	elif not is_zero_approx(direction):
		animated_sprite.play("run")
		animated_sprite.flip_h = direction < 0
	else:
		animated_sprite.play("idle")

func _on_portal_body_entered(body: Node2D) -> void:
	if body == self:
		get_tree().change_scene_to_file("res://level 2.tscn")
