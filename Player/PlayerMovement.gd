extends KinematicBody2D

const DASHFORCE = 600
const MOVESPEED = 25
const DASHCOOLDOWN = 0.5

var friction = 0.8
var motion = Vector2()  # The player's movement vector.
var dir = Vector2() #input direction
var state # not used btw
var can_dash = true
var respawn_point
var may_move
var level_won

var animated_sprite
var animation_player

func _ready():
	level_won = false
	may_move = true
	respawn_point = position
	animated_sprite = $AnimatedSprite
	animation_player = $AnimationPlayer
	$DashCoolDown.wait_time = DASHCOOLDOWN

func _process(delta):
	if may_move:
		manage_dir()
		add_forces(delta)
		move()
		dash()

func manage_dir():
	dir = Vector2.ZERO
	if Input.is_action_pressed("Right"):
		dir.x += 1
	if Input.is_action_pressed("Left"):
		dir.x -= 1
	if Input.is_action_pressed("Down"):
		dir.y += 1
	if Input.is_action_pressed("Up"):
		dir.y -= 1
	if dir.y == 1:
		animated_sprite.animation = "WalkS"
	elif dir.y == -1:
		animated_sprite.animation = "WalkW"
	elif dir.x == 1:
		animated_sprite.animation = "WalkD"
	elif dir.x == -1:
		animated_sprite.animation = "WalkA"
	else:
		animated_sprite.animation = "Idle" + animated_sprite.animation.right(4)
	dir = dir.normalized()

func move():
	motion += dir * MOVESPEED
	motion = move_and_slide(motion)

func add_forces(_delta):
	motion *= friction #friction

func dash():
	if Input.is_action_just_pressed("Dash") and can_dash:
		motion = Vector2.ZERO
		motion += dir * DASHFORCE
		can_dash = false
		$DashCoolDown.start()
		
func spiked():
	may_move = false
	animation_player.play("Die")
	

func die():
	position = respawn_point
	may_move = true

func _on_DashCoolDown_timeout():
	can_dash = true
