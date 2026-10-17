extends State
class_name EnemyAttack

@export var enemy : CharacterBody2D
@export var damage : float

var player : CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var attack_cd := 2.0
var attack_timer := 0.0

func Enter():
	attack_timer = 0.0
	print("attacking")
	player = get_tree().get_first_node_in_group("Player")
	enemy.velocity = Vector2(0.0, 0.0)
	
func Physics_Update(delta: float):
	attack_timer += delta
	if attack_timer >= attack_cd:
		Transitioned.emit(self, "idle")
	pass
