extends BossState
class_name BossAlive

@export var phase1_state : BossState
@export var transition_state : BossState
@export var phase2_state : BossState
@export var death_state : BossState

var phase1_transition_started : bool = false
var phase2_transition_started : bool = false
var death_transition_started : bool = false


func enter():
	super.enter()
	phase1_transition_started = false
	phase2_transition_started = false
	death_transition_started = false
	print("alive")

	if boss.hp <= 0:
		death_transition_started = true
		transition_to(death_state)
	elif boss.hp <= 50 and boss.hp > 0:
		phase2_transition_started = true
		transition_to(transition_state)
	else:
		phase1_transition_started = true
		transition_to(phase1_state)
	
func physics_update(_delta: float) -> void:
	if phase1_transition_started || phase2_transition_started:
		return
	
	elif boss.hp <= 50 and boss.hp > 0:
		phase2_transition_started = true
		transition_to(transition_state)
		return
		
	if death_transition_started:
		return
		
	elif boss.hp <= 0:
		print("death shall begin")
		death_transition_started = true
		transition_to(death_state)
