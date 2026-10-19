extends BossState
class_name BossAoE

@export var phase : BossState

@export var attack_timer := 2.0
var time_elapsed := 0.0

func enter() -> void:
	time_elapsed = 0.0
	
func physics_update(delta: float) -> void:
	time_elapsed += delta
	
	if time_elapsed >= attack_timer:
		time_elapsed = 0.0
		transition_to(phase)
