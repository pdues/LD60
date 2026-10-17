extends State
class_name EnemyIdle

@export var enemy : CharacterBody2D
@export var move_speed := 20.0

var player : CharacterBody2D

var move_direction : Vector2
var wander_time : float
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), 0).normalized()
	wander_time = randf_range(1, 3)

func Enter():
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	pass
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
		
	else:
		randomize_wander()

func Physics_Update(delta: float):
	if enemy:
		if not enemy.is_on_floor():
			enemy.velocity.y += gravity * delta
		enemy.velocity.x = move_direction.x * move_speed
		
	var direction = player.global_position - enemy.global_position
	if direction.length() < 50:
		Transitioned.emit(self, "chase")
