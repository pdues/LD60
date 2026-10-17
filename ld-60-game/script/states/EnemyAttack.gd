extends State
class_name EnemyAttack

@export var enemy : CharacterBody2D

var player : CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	print("attacking")
	player = get_tree().get_first_node_in_group("Player")
	enemy.velocity = Vector2(0.0, 0.0)
	
func Physics_Update(delta: float):
	pass
