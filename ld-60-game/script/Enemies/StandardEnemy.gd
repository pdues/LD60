extends CharacterBody2D
class_name StandardEnemy

@export var hp = 5
@export var hurtbox: Hurtbox
@export var stats : ObjectStats
@export var aggro_range : float = 100.0
@export var attack_range : float = 20.0
@export var sprite : AnimatedSprite2D
@export var lamp : PointLight2D
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hit : bool = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()

#func _on_hitbox_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	#if body.is_in_group("Player"):
		#print("player is hit")
	#pass # Replace with function body.

func _on_hurtbox_area_entered(area: Area2D) -> void:
	var hitbox = area as Hitbox
	if not hitbox || not hitbox.get_parent().is_in_group("Player"):
		return
	hit = true
	#stats.current_health -= 1
	#print(stats.current_health)
