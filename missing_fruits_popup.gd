extends Popup

@onready var ok_button = $Button  # This matches your actual node name

func _ready() -> void:
	ok_button.pressed.connect(_on_ok_button_pressed)  # Connect signal manually

func _on_ok_button_pressed() -> void:
	hide()  # Hides the popup when OK is clicked

func _on_button_pressed() -> void:
	pass # Replace with function body.
	hide()
