extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level1.tscn")
	pass


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://how to play.tscn")
	

func respawn():
	get_tree().reload_current_scene()
	
func process(delta):
	var animation_player
	if Input.is_action_pressed: ("ui_right")
	animation_player.play("running")
	if Input.is_action_pressed: ("ui_left")
	animation_player.play("running")

var player_health = 100
var player

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	pass
