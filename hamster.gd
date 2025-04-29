extends CharacterBody2D

# Adjustable parameters
@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

@onready var animated_sprite = $AnimatedSprite2D  # Reference to the AnimatedSprite2D node

func _physics_process(delta):
	var direction = 0.0
	
	# Get horizontal input
	if Input.is_action_pressed("ui_left"):
		direction -= 1.0
	if Input.is_action_pressed("ui_right"):
		direction += 1.0

	# Apply horizontal velocity
	velocity.x = direction * speed

	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		# Jump if on ground and jump pressed
		if Input.is_action_just_pressed("ui_accept"):
			velocity.y = jump_velocity

	# Move the character
	move_and_slide()

	# Update animation based on movement
	update_animation(direction)

func update_animation(direction: float):
	if not is_zero_approx(direction):
		# Play run animation and flip sprite if moving left
		animated_sprite.play("run")
		animated_sprite.flip_h = direction < 0
	else:
		# Play idle animation when no input
		animated_sprite.play("idle")


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_portal_body_entered(body: Node2D) -> void:
	if body == self:
		get_tree().change_scene_to_file("res://level 2.tscn")
