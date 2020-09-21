extends Area2D

var deathScene = preload("res://Environment/CoinTaken.tscn")


func _on_Coin_body_entered(body):
	Singelton.coins += 1
	var d = deathScene.instance()
	d.global_position = global_position
	get_parent().add_child(d)
	queue_free()
