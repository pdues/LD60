extends BossState
class_name BossStart

@export var aggro_range : int = 150
@export var alive_state: BossState
@export var intro_duration := 2.0

var elapsed := 0.0

func enter() -> void:
	super.enter()
	elapsed = 0.0

func physics_update(delta: float):		
	if boss.distance.length() <= aggro_range:
		elapsed += delta
		if elapsed >= intro_duration:
			print("start")
			transition_to(alive_state)
