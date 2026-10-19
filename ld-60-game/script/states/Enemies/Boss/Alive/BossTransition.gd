extends BossState
class_name BossTransition

@export var phase2_state : BossState
@export var transition_time : float = 2.0

var time_elapsed : float = 0.0

func enter() -> void:
	# start animation
	time_elapsed = 0.0
	boss.velocity = Vector2(0.0, 0.0)
	
func physics_update(delta: float) -> void:
	time_elapsed += delta
	
	if time_elapsed >= transition_time:
		transition_to(phase2_state)

func exit() -> void:
	time_elapsed = 0.0
