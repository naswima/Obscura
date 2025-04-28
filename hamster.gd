extends CharacterBody2D

@export var move_speed: float = 200
@export var jump_force: float = 400
@export var gravity: float = 900

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	var input_dir = get_player_input()

	# Apply gravity
	velocity.y += gravity * delta
	
	# Handle left/right movement
	velocity.x = input_dir.x * move_speed

	# Handle jump
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force

	move_and_slide()

	update_animation(input_dir)

func get_player_input() -> Vector2:
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	return input.normalized()

func update_animation(input_dir: Vector2):
	if not is_on_floor():
		animated_sprite.play("jump")
	elif input_dir.length() > 0:
		animated_sprite.play("walk")
		
		if input_dir.x != 0:
			animated_sprite.flip_h = input_dir.x < 0
	else:
		animated_sprite.play("idle")
