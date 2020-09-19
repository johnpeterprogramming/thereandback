extends KinematicBody2D


var move_speed = 400

func _ready():
	print("bruh moment")

func _process(delta):
	var motion = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		motion.x += 1
	if Input.is_action_pressed("ui_left"):
		motion.x -= 1
	if Input.is_action_pressed("ui_down"):
		motion.y += 1
	if Input.is_action_pressed("ui_up"):
		motion.y -= 1
		
	if motion.length() > 0:
		motion = motion.normalized() * move_speed
	position += motion * delta
