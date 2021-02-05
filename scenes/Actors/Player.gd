extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const GRAVITY = 20
const SPEED = 500
const JUMP_HEIGHT = -800


func _physics_process(delta):
	motion.y += GRAVITY
	motion = move_and_slide(motion, UP)
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left") :
		motion.x = -SPEED
	else:
		motion.x = 0
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
	if motion.length() > 0:
		$player.play()
	else:
		$player.play("stand")
	if motion.x != 0:
		$player.animation = "walk"
		$player.flip_h = motion.x < 0
	elif motion.y != 0:
		$player.animation = "up"



