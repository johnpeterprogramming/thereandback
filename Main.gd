extends Node2D

func _ready():
	SceneChanger.memes_collected = 0
	for i in get_children():
		if 'Meme' in i.name:
			i.connect("meme_changed", $GUI, "_on_Meme_meme_changed")

