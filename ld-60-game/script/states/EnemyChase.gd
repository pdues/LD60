extends State
class_name EnemyChase

@export var enemy : CharacterBody2D
@export var move_speed := 60.0

var player : CharacterBody2D
var hitbox_attack : CollisionShape2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	hitbox_attack = enemy.get_children(true)[2].get_child(0)
	player = get_tree().get_first_node_in_group("Player")
	
func Physics_Update(delta: float):
	if not enemy.is_on_floor():
		enemy.velocity.y += gravity * delta
			
	var direction = player.global_position - enemy.global_position
	if direction.x > 0:
		hitbox_attack.position.x = 4.0
	else:
		hitbox_attack.position.x = -4.0
	
	if direction.length() > 20:
		enemy.velocity.x = direction.normalized().x * move_speed
	else:
		enemy.velocity = Vector2()
		Transitioned.emit(self, "attack")
		
	if direction.length() > 50:
		Transitioned.emit(self, "idle")
