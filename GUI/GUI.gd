extends CanvasLayer

func _on_Meme_meme_changed():
	SceneChanger.memes_collected += 1
	$MarginContainer/HBoxContainer/MemesCollected.text = str(SceneChanger.memes_collected)
