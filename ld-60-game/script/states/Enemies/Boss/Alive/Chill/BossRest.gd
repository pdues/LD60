extends BossState
class_name BossRest

@export var phase1_state : BossState
@export var rest_time : float = 3.0

var time_resting : float = 0.0

func enter():
	super.enter()
	print("resting")
	boss.velocity = Vector2(0.0, 0.0)
	time_resting = 0.0
	# play animation (idle, exhaustion, etc...)

func physics_update(delta: float):
	time_resting += delta
	
	var weight = 1 - exp(-boss.stopping_speed * delta)
	boss.velocity = boss.velocity.lerp(Vector2(0.0,0.0), weight)
	boss.move_and_slide()
	
	if time_resting >= rest_time:
		print("no more resting")
		transition_to(phase1_state)
		
func exit() -> void:
	super.exit()
	time_resting = 0.0
