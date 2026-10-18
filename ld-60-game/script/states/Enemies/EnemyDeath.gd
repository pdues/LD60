extends State
class_name EnemyDeath

@export var enemy : CharacterBody2D

func Enter():
	print("dead")
	#play death animation
	enemy.queue_free()
