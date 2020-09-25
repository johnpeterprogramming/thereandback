extends Area2D

var deathScene = preload("res://Memes/MemeTaken.tscn")

func _ready():
	SceneChanger.memes_collected = 0

func _on_Coin_body_entered(_body):
	SceneChanger.memes_collected += 1
	print(SceneChanger.memes_collected)
	var d = deathScene.instance()
	d.global_position = global_position
	get_parent().add_child(d)
	$Yee.play()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	yield($Yee, "finished")
	queue_free()
