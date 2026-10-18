extends CharacterBody2D

@export var hp : int = 50
@export var i_frames : int
@export var respawnpoint : Node2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hit : bool = false
var dir := "right"


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta
	move_and_slide()
	
	

func _on_hurtbox_area_entered(area: Area2D) -> void:
	var hitbox = area as Hitbox
	if not hitbox || not hitbox.get_parent().is_in_group("Enemy"):
		return
	hit = true
	
	
	

	
