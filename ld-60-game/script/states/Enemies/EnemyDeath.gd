extends State
class_name EnemyDeath

@export var enemy : CharacterBody2D

func Enter():
	print("dead")
	enemy.sprite.play("dead")
	enemy.set_collision_layer_value(4,false)
	enemy.set_collision_mask_value(3,false)
	enemy.lamp.enabled = false
