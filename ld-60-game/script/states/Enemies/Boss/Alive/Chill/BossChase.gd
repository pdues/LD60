extends BossState
class_name BossChase

@export var phase1_state : BossState
@export var chase_time : float = 3.0

var time_chasing : float = 0.0
var transition : bool = false
var flip : bool = false

func enter():
	super.enter()
	time_chasing = 0.0
	transition = false
	print("chasing")
	print(boss.distance.x)
	# play animation (idle, exhaustion, etc...)

func physics_update(delta: float):
	if boss.distance.x > 0:
		flip = false
		
	if boss.distance.x <= 0:
		flip = true
	
	if transition:
		return
	
	elif time_chasing >= chase_time:
		transition = true
		print("no more chasing")
		boss.boss_sprite.set_flip_h(flip)
		transition_to(phase1_state)
	
	else:
		time_chasing += delta
		boss.boss_sprite.set_flip_h(flip)
		boss.velocity = boss.distance.normalized() * boss.move_speed
		
func exit() -> void:
	super.exit()
	time_chasing = 0.0
