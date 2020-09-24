extends Node2D

var delay
var reload
var body_name

func _ready():
	delay = $SpikeDelay
	reload = $SpikeReload

func _on_Area2D_body_entered(body):
	body_name = body
	if body.has_method("die"):
		delay.start()

func _on_Area2D_body_exited(body):
	if body.has_method("die"):
		delay.stop()



func _on_SpikeDelay_timeout():
	body_name.spiked()
	$Area2D/Sprite.modulate.r = 1
	reload.start()
	
func _on_SpikeReload_timeout():
	$Area2D/Sprite.modulate.r = 0
