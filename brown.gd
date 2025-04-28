extends Sprite2D

var texture = ImageTexture.new()
var image = Image.load_from_file("res://your_texture.png")
texture.create_from_image(image)
texture.flags |= Texture.FLAG_REPEAT
