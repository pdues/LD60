extends State
class_name EnemyAttack

@onready var hitbox_attack: CollisionShape2D
@export var enemy : CharacterBody2D
@export var damage : float

var player : CharacterBody2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var attack_cd := 1.0
var attack_timer := 0.0

func Enter():
	hitbox_attack = enemy.get_children(true)[2].get_child(0)
	attack_timer = 0.0
	print("attacking")
	player = get_tree().get_first_node_in_group("Player")
	enemy.velocity = Vector2(0.0, 0.0)
	
func Exit():
	hitbox_attack.disabled = true	
	
func Physics_Update(delta: float):
	if attack_timer > 0.2:
		hitbox_attack.disabled = false
	if attack_timer > 0.8:
		hitbox_attack.disabled = true
	if attack_timer >= attack_cd:
		Transitioned.emit(self, "idle")
	attack_timer += delta
