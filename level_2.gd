extends Node2D

var player_entered = false

func _on_button_pressed() -> void:
	var main_scene = load("res://main.tscn")
	get_tree().change_scene_to_packed(main_scene)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_entered = true
		print("Item picked up!")

func _on_area_2d_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and player_entered:
		$WinPopup.show()

@onready var music_player = $AudioStreamPlayer

func _ready():
	var music_stream = load("res://bgm_menu.mp3")
	if music_stream is AudioStream:
			music_stream.loop = true
			music_player.stream = music_stream
			music_player.play()

func _on_win_popup_popup_hide() -> void:
	pass # Replace with function body.
