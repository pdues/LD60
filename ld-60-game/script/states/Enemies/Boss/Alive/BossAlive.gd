extends BossState
class_name BossAlive

@export var phase1_state : BossState
@export var transition_state : BossState
@export var phase2_state : BossState

func enter():
	super.enter()
	print("alive")
	print(get_children())
	
func physics_update(_delta: float) -> void:
	if boss.hp <= 50:
		# Only transition if we aren't already transitioning.
		if not machine.active_path.has(transition_state):
			transition_to(transition_state)
	else:
		# Only transition to Phase1 if we're not already in it.
		if not machine.active_path.has(phase1_state):
			transition_to(phase1_state)
