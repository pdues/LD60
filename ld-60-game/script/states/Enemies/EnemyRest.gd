extends State
class_name EnemyRest

@export var enemy : CharacterBody2D
@export var rest_time : float
@export var hurtbox : Hurtbox
@export var stopping_speed : float = 10.0

var time_elapsed : float

func Enter():
	time_elapsed = 0.0
	# play rest animation

func Update(delta: float):
	var weight = 1 - exp(-stopping_speed * delta)
	enemy.velocity = enemy.velocity.lerp(Vector2(0.0,0.0), weight)

func Physics_Update(delta: float):
	if enemy.hit == true:
		Transitioned.emit(self, "hurt")
	
	time_elapsed += delta
	if time_elapsed >= rest_time:
		Transitioned.emit(self, "wander")
