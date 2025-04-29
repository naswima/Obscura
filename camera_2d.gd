extends Camera2D

func _ready():
	make_current()
	zoom = Vector2(2, 2)  # Optional: adjust as needed

func _input(event):
	if event.is_action_pressed("ui_fullscreen"):
		var current_mode = DisplayServer.window_get_mode()

		if current_mode != DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
