extends KinematicBody2D

const SPEED = 300
var velocity = Vector2()
var direction = 1


func _physics_process(delta):
	if direction == 1:
		$Bee.flip_h = true
	else:
		$Bee.flip_h = false
	velocity.x = SPEED * direction
	$Bee.play("move")
	
	
	velocity = move_and_slide(velocity)
	
	if is_on_wall():
		direction = direction * -1



func _on_die_body_entered(body):
	if  body.global_position.y > $die.global_position.y:
		return
	$CollisionShape2D.disabled = true
	queue_free()
