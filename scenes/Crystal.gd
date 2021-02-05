extends Area2D




func _on_Crystal_body_entered(body):
	if  body.global_position > $".".global_position:
		return
	queue_free()
