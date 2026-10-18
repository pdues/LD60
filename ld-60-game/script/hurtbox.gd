extends Area2D
class_name Hurtbox

@export var stats : ObjectStats
var is_hit : bool = false

func get_hittable() -> bool:
	return stats.current_health > 0
