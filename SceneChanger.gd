extends CanvasLayer


onready var animation_player = $AnimationPlayer
onready var black = $Control/Black

var current_meme : String
var memes_collected = 0


func change_scene(scene, meme='', delay=5):
	$Control.show()
	if meme:
		current_meme = meme
		fade_in_and_out("res://Memes/EndMeme.tscn")
		yield(get_tree().create_timer(delay), "timeout")
		
	fade_in_and_out(scene)

func fade_in_and_out(scene):
	animation_player.play("fade")
	yield(animation_player, "animation_finished")
	get_tree().change_scene(scene)
	animation_player.play_backwards("fade")

func _ready():
	$Control.hide()
