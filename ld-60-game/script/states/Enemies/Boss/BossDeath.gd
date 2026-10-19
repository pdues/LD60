extends BossState
class_name BossDeath

@export var death_duration : float = 2.0

var time_elapsed := 0.0

func enter() -> void:
	time_elapsed = 0.0
	boss.velocity = Vector2(0.0, 0.0)
	print("Dead")
	
func physics_update(delta: float) -> void:
	time_elapsed += delta
	
	if time_elapsed >= death_duration:
		boss.queue_free()
