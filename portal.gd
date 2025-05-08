extends Area2D

@onready var collision_shape = $CollisionShape2D
@export var fruitneeded := 30
@export var nextlevel: PackedScene

@onready var missing_fruits_popup = $MissingFruitsPopup
@onready var activation_delay = $ActivationDelay

var is_active := false

func _ready():
	is_active = false  # Start inactive
	activation_delay.timeout.connect(self._on_activation_delay_timeout)

func _on_activation_delay_timeout():
	is_active = true  # Now allow player to trigger the portal

func _on_body_entered(body: Node2D) -> void:
	if not is_active:
		return

	if body.is_in_group("player"):
		if "pickedupitems" in body and body.pickedupitems >= fruitneeded:
			if nextlevel:
				get_tree().change_scene_to_packed(nextlevel)
			else:
				push_error("nextlevel is not a valid PackedScene!")
		else:
			$MissingFruitsPopup.popup_centered()

func _on_ok_button_pressed():
	$MissingFruitsPopup.hide()
