extends CharacterBody2D
class_name Boss

@export var hp : int = 100
@export var hurtbox : Hurtbox
@export var stats : ObjectStats
@export var move_speed : float = 10.0
@export var stopping_speed : float = 5.0
@export var max_attack_range : float = 10.0

var hit : bool = false
var player : CharacterBody2D
var distance : Vector2

func _physics_process(delta: float) -> void:
	player = get_tree().get_first_node_in_group("Player")
	distance = player.global_position - self.global_position
	move_and_slide()
