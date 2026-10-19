extends BossState
class_name BossAlive

@export var phase1_state : BossState
@export var transition_state : BossState
@export var phase2_state : BossState
@export var death_state : BossState

var phase_transition_started : bool = false
var death_transition_started : bool = false


func enter():
	super.enter()
	phase_transition_started = false
	death_transition_started = false
	print("alive")

	if boss.hp <= 0:
		death_transition_started = true
		transition_to(death_state)
	elif boss.hp <= 50 and boss.hp > 0:
		phase_transition_started = true
		transition_to(transition_state)
	else:
		transition_to(phase1_state)
	
func physics_update(_delta: float) -> void:
	if phase_transition_started:
		return
	
	elif boss.hp <= 50 and boss.hp > 0:
		phase_transition_started = true
		transition_to(transition_state)
		return
		
	if death_transition_started:
		return
		
	elif boss.hp <= 0:
		print("death shall begin")
		death_transition_started = true
		transition_to(death_state)
		return

	transition_to(phase1_state)
