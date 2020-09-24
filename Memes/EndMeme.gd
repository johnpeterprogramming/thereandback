extends Control

func _ready():
	var meme_texture = load(SceneChanger.current_meme)
	$TextureRect.texture = load(SceneChanger.current_meme)
	print($TextureRect.texture)
