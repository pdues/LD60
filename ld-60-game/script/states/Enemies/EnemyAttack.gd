extends State
class_name EnemyAttack

@onready var hitbox_attack: CollisionShape2D
@export var enemy : CharacterBody2D
@export var damage : float

var player : CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var attack_duration := 0.5
var attack_timer := 0.0

func Enter():
	hitbox_attack = enemy.get_children(true)[2].get_child(0)
	attack_timer = 0.0
	print("attacking")
	player = get_tree().get_first_node_in_group("Player")
	hitbox_attack.disabled = false
	
func Exit():
	hitbox_attack.disabled = true
	
func Physics_Update(delta: float):
	if enemy.hit == true:
		Transitioned.emit(self, "hurt")
	
	if attack_timer >= attack_duration:
		Transitioned.emit(self, "rest")
	attack_timer += delta
