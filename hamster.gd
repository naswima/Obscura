extends CharacterBody2D

# Adjustable parameters
@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

func _physics_process(delta):
	var direction = 0.0
	
	# Move left/right
	if Input.is_action_pressed("ui_left"):
		direction -= 1
	if Input.is_action_pressed("ui_right"):
		direction += 1

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
