extends BossState
class_name BossChill

@export var rest_state : BossState
@export var chase_state : BossState

func enter():
	super.enter()
	print("chill")
	
	if randf() < 0.5:
		print("enter chase")
		transition_to(chase_state)
	else:
		print("enter rest")
		transition_to(rest_state)
		
func physics_update(_delta: float) -> void:
	pass
