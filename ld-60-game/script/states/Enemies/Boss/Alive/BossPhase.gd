extends BossState
class_name BossPhase

@export var chill_state : BossState
@export var attack_state : BossState

var choice : int
var max_attack_range
	
func enter():
	super.enter()
	max_attack_range = boss.max_attack_range
	print("phase1")
	if boss.distance.length() <= max_attack_range:
		transition_to(attack_state)
	else:
		transition_to(chill_state)
		
func physics_update(_delta: float) -> void:
	pass
