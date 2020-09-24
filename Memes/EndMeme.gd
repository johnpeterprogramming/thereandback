extends Control

func _ready():
	var meme_texture = load(Singelton.current_meme)
	$TextureRect.texture = load(Singelton.current_meme)
	print($TextureRect.texture)
