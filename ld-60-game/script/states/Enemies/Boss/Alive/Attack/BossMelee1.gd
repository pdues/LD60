extends BossState
class_name BossMelee1

@export var phase : BossState

@export var attack_timer := 2.0
var time_elapsed := 0.0

func enter() -> void:
	time_elapsed = 0.0
	boss.boss_sprite.set_animation("melee")
	boss.hitbox_melee1.disabled = false
	if boss.distance.x >= 0:
		boss.hitbox_melee1.position.x = 13.0
		boss.boss_sprite.position.x = 16.0
		boss.boss_sprite.set_flip_h(false)
	elif boss.distance.x < 0:
		boss.hitbox_melee1.position.x = -13.0
		boss.boss_sprite.position.x = -16.0
		boss.boss_sprite.set_flip_h(true)

func physics_update(delta: float) -> void:
	time_elapsed += delta
	
	if time_elapsed >= attack_timer:
		time_elapsed = 0.0
		transition_to(phase)

func exit() -> void:
	if boss.distance.x >= 0:
		boss.boss_sprite.position.x = 16.0
		boss.boss_sprite.set_flip_h(false)
	elif boss.distance.x < 0:
		boss.boss_sprite.position.x = -16.0
		boss.boss_sprite.set_flip_h(true)
	
	boss.boss_sprite.set_animation("idle")
	boss.hitbox_melee1.disabled = true
