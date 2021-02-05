extends Node2D

onready var enemy = preload("res://scenes/Actors/Enemy.tscn")

func _ready():
	$Timer.start()

func spawn() :
	var spawn_position = $positions.get_child(randi() % $positions.get_child_count())
	var new_enemy = enemy.instance()
	add_child(new_enemy)
	new_enemy.global_position = spawn_position.global_position

func _on_Timer_timeout():
	spawn()
