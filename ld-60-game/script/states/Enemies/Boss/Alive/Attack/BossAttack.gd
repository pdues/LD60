extends BossState
class_name BossAttack

@export var melee1_state : BossState
@export var melee2_state : BossState
@export var AoE_state : BossState

var choice : int

func enter():
	print("attacking")
	boss.velocity = Vector2(0.0, 0.0)
	var choice = randi_range(0,2) 
	if choice == 0:
		transition_to(melee1_state)
	elif choice == 1:
		transition_to(melee2_state)
	else:
		transition_to(AoE_state)
