extends BossState
class_name BossChase

@export var phase1_state : BossState
@export var chase_time : float = 3.0

var time_chasing : float = 0.0

func enter():
	super.enter()
	time_chasing = 0.0
	print("chasing")
	# play animation (idle, exhaustion, etc...)

func physics_update(delta: float):
	time_chasing += delta
	
	boss.velocity = boss.distance.normalized() * boss.move_speed
	
	if time_chasing >= chase_time:
		print("no more chasing")
		transition_to(phase1_state)
		
func exit() -> void:
	super.exit()
	time_chasing = 0.0
