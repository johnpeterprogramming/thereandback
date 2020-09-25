extends Area2D

var deathScene = preload("res://Memes/MemeTaken.tscn")

signal meme_changed

func _on_Coin_body_entered(_body):
	emit_signal("meme_changed")
	var d = deathScene.instance()
	d.global_position = global_position
	get_parent().add_child(d)
	$Yee.play()
	hide()
	$CollisionShape2D.set_deferred("disabled", true)
	yield($Yee, "finished")
	queue_free()
