extends BossState
class_name BossPhase1

@export var chill_state : BossState
@export var attack_state : BossState
@export var death_state : BossState
@export var phase_transition : BossState

var choice : int
var max_attack_range

var dead : bool = false
var attacking : bool = false
var chill : bool = false
var phase2 : bool = false


func enter():
	super.enter()
	dead = false
	attacking = false
	chill = false
	phase2 = false
	max_attack_range = boss.max_attack_range
	
	print("phase1")
	if boss.hp <= 0:
		dead = true
		transition_to(death_state)
		
	elif boss.hp <= 50 && boss.hp > 0:
		phase2 = true
		transition_to(phase_transition)
	
	elif boss.distance.length() <= max_attack_range:
		attacking = true
		transition_to(attack_state)
		
	else:
		chill = true
		transition_to(chill_state)
		
#func physics_update(_delta: float) -> void:
	#if dead || attacking || chill:
		#return
	#elif boss.hp <= 0:
		#dead = true
		#transition_to(death_state)
	#else:
		#return
