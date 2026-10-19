extends BossState
class_name BossTransition

@export var phase2_state : BossState

func enter() -> void:
	# start animation
	boss.velocity = Vector2(0.0, 0.0)
	transition_to(phase2_state)
