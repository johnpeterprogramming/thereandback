extends Area2D

export(String) var next_scene
export(String) var meme_collected
export(int) var min_memes

func _on_End_body_entered(_body):
	if SceneChanger.memes_collected >= min_memes:
		SceneChanger.change_scene(next_scene, meme_collected)
