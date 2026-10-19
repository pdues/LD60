extends CharacterBody2D
class_name Boss

@export var hp : int = 100
@export var hurtbox : Hurtbox
@export var hitbox_melee1 : CollisionShape2D
@export var hitbox_melee2 : CollisionShape2D
@export var hp_bar : TextureProgressBar


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
	#
	
func _on_hurtbox_area_entered(area: Area2D) -> void:
	print(area)
	var hitbox = area as Hitbox
	if not hitbox || not hitbox.get_parent().is_in_group("Player"):
		return
	hit = true
	print("boss is hit")
	hp -= 5
	hp_bar.value = self.hp
