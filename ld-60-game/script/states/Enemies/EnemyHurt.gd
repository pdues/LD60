extends State
class_name EnemyHurt

@export var enemy : CharacterBody2D
var player : CharacterBody2D
var bounce : int = 200

func knockback():
	var direction = player.global_position - enemy.global_position
	enemy.velocity.x = -direction.normalized().x * bounce
	
func Enter():
	player = get_tree().get_first_node_in_group("Player")
	knockback()
	
func Exit():
	enemy.hit = false
	
func Physics_Update(delta: float):
	enemy.hp -= 1
	
	if enemy.hp == 0:
		Transitioned.emit(self, "death")
	else:
		Transitioned.emit(self, "rest")
