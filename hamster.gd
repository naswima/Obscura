extends CharacterBody2D

@onready var item = $ItemNode  # Reference to the Area2D item node (make sure the path is correct)
@onready var animated_sprite = $AnimatedSprite2D  # Reference to the animated sprite

# --- Movement and Physics ---
@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

# --- Combat & State ---
var is_attacking: bool = false
var health: int = 100

# Item pickup signal function
func _on_item_picked_up(item_name: String) -> void:
	print("Picked up item:", item_name)
	# Add the item to inventory or perform other logic here

# --- Animation ---
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
		is_attacking = false  # Set attacking to false when attack animation finishes

# --- Portal Interaction ---
func _on_portal_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().change_scene_to_file("res://level_2.tscn")

# --- _ready() Function ---
func _ready():
	add_to_group("player")  # Add player to "player" group for collision detection (if needed)

	# Check if the item node exists
	if item:
		# Correctly create a Callable reference for the signal connection
		item.connect("picked_up", Callable(self, "_on_item_picked_up"))  # Use Callable for signal connection
	else:
		print("Item node not found!")  # This will print if item node is missing in the scene

	animated_sprite.connect("animation_finished", Callable(self, "_on_animation_finished"))  # Connect animation finished signal

# --- Physics Process ---
func _physics_process(delta):
	var direction := Vector2.ZERO

	# --- Input (only if not attacking) ---
	if not is_attacking:
		if Input.is_action_pressed("ui_right"):
			direction.x += 1
			animated_sprite.flip_h = false
		if Input.is_action_pressed("ui_left"):
			direction.x -= 1
			animated_sprite.flip_h = true

		# Jump
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = jump_velocity

	# --- Gravity ---
	if not is_on_floor():
		velocity.y += gravity * delta

	# --- Velocity and Movement ---
	if not is_attacking:
		velocity.x = direction.x * speed
		move_and_slide()  # Correct use of move_and_slide for CharacterBody2D

	# --- Animation ---
	update_animation(direction)
