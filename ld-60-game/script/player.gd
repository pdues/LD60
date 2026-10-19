extends CharacterBody2D

@export var hp : int = 50
@export var i_frames : int
@export var respawnpoint : Node2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hit : bool = false
var dir := "right"

var gets_hit_by : String

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
	

func _on_hurtbox_area_entered(area: Area2D) -> void:
	print(area.get_parent().get_groups())
	var hitbox = area as Hitbox
	if not hitbox || (not hitbox.get_parent().is_in_group("Enemy") and not hitbox.get_parent().is_in_group("Boss")):
		return
	
	if hitbox.get_parent().is_in_group("Enemy"):
		gets_hit_by = "Enemy"
	elif hitbox.get_parent().is_in_group("Boss"):
		gets_hit_by = "Boss"
	hit = true
	
	
	

	
