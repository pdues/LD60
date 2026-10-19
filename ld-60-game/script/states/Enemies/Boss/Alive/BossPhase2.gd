extends BossState
class_name BossPhase2

@export var chill_state : BossState
@export var attack_state : BossState
@export var death_state : BossState

var choice : int
var max_attack_range

var dead : bool = false
var attacking : bool = false
var chill : bool = false

func enter():
	super.enter()
	dead = false
	attacking = false
	chill = false
	max_attack_range = boss.max_attack_range
	
	print("phase1")
	if boss.hp <= 0:
		dead = true
		transition_to(death_state)
	
	elif boss.distance.length() <= max_attack_range:
		attacking = true
		transition_to(attack_state)
		
	else:
		chill = true
		transition_to(chill_state)
