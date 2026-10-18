extends State
class_name EnemyWander

@export var enemy : CharacterBody2D
@export var move_speed := 20.0

var player : CharacterBody2D
var hitbox_attack : CollisionShape2D

var move_direction : Vector2
var wander_time : float
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func randomize_wander():
	move_direction = Vector2(randf_range(-1, 1), 0).normalized()
	wander_time = randf_range(1, 3)

func Enter():
	hitbox_attack = enemy.get_children(true)[2].get_child(0)
	player = get_tree().get_first_node_in_group("Player")
	randomize_wander()
	pass
	
func Update(delta: float):
	if wander_time > 0:
		wander_time -= delta
	else:
		Transitioned.emit(self, "rest")

func Physics_Update(delta: float):
	if enemy.hit == true:
		Transitioned.emit(self, "hurt")
	if enemy:
		if not enemy.is_on_floor():
			enemy.velocity.y += gravity * delta
		enemy.velocity.x = move_direction.x * move_speed
		if enemy.velocity.x > 0:
			hitbox_attack.position.x = 4.0
		else:
			hitbox_attack.position.x = -4.0
		
	var direction = player.global_position - enemy.global_position
	if direction.length() < enemy.aggro_range:
		Transitioned.emit(self, "chase")
