extends BossState
class_name BossMelee2

@export var phase : BossState

@export var attack_timer := 2.0
var time_elapsed := 0.0

func enter() -> void:
	time_elapsed = 0.0
	boss.hitbox_melee2.disabled = false
	if boss.distance.x >= 0:
		boss.hitbox_melee2.position.x = 42.0
	elif boss.distance.x < 0:
		boss.hitbox_melee2.position.x = -42.0
	
func physics_update(delta: float) -> void:
	time_elapsed += delta
	
	if time_elapsed >= attack_timer:
		time_elapsed = 0.0
		transition_to(phase)
		
func exit() -> void:
	boss.hitbox_melee2.disabled = true
