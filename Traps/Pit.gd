extends Node2D

var timer
var body_name

func _ready():
	timer = $Timer

func _process(delta):
	print($Timer.time_left)

func _on_Area2D_body_entered(body):
	body_name = body
	if body.has_method("die"):
		body.falling = true
		$Timer.start()

func _on_Area2D_body_exited(body):
	if body.has_method("die"):
		body.falling = false
		$Timer.stop()

func _on_Timer_timeout():
	body_name.die()
