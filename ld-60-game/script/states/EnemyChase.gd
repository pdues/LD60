extends State
class_name EnemyChase

@export var enemy : CharacterBody2D
@export var move_speed := 60.0

var player : CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(delta: float):
	if not enemy.is_on_floor():
			enemy.velocity.y += gravity * delta
			
	var direction = player.global_position - enemy.global_position
	
	if direction.length() > 20:
		enemy.velocity = direction.normalized() * move_speed
	else:
		enemy.velocity = Vector2()
		Transitioned.emit(self, "attack")
		
	if direction.length() > 50:
		Transitioned.emit(self, "idle")
