extends CharacterBody2D
func _readyy():
	add_to_group("player")

# --- Movement and Physics ---
@export var speed: float = 200.0
@export var jump_velocity: float = -500.0
@export var gravity: float = 1200.0

# --- Combat & State ---
var is_attacking: bool = false
var health: int = 100

# --- Nodes ---
@onready var animated_sprite = $AnimatedSprite2D

func _ready():
	# Connect animation finished signal
	animated_sprite.connect("animation_finished", Callable(self, "_on_animation_finished"))

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
		move_and_slide()

	# --- Animation ---
	update_animation(direction)

func update_animation(direction: Vector2) -> void:
	if is_attacking:
		animated_sprite.play("attack")
	elif not is_on_floor():
		animated_sprite.play("jumping")
	elif direction.x != 0:
		animated_sprite.play("walking")
	else:
		animated_sprite.play("default")


func _on_portal_body_entered(body: Node2D) -> void:
	if body == self:
		get_tree().change_scene_to_file("res://level 2.tscn")
