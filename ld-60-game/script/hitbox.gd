extends Area2D
class_name Hitbox

signal hit(target : Hurtbox, amount : int)

@export var weapon_stats : WeaponStats

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(p_area : Area2D):
	var hurtbox = p_area as Hurtbox
	
	if not hurtbox || not hurtbox.get_hittable():
		return
	
	#var damage_dealt = weapon_stats.damage
	#hurtbox.stats.current_health -= damage_dealt
	#hit.emit(hurtbox, damage_dealt)
