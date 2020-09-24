extends Area2D

export(String) var next_scene
export(String) var meme_collected

func _on_End_body_entered(body):
	SceneChanger.change_scene(next_scene, meme_collected)
