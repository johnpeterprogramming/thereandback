extends Control

func _ready():
	$TextureRect.texture = load(SceneChanger.current_meme)
