extends Area2D

var deathScene = preload("res://Memes/MemeTaken.tscn")


func _on_Coin_body_entered(_body):
	var d = deathScene.instance()
	d.global_position = global_position
	get_parent().add_child(d)
	queue_free()