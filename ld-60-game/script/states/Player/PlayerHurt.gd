extends State
class_name PlayerHurt

@export var player : CharacterBody2D
	
func Exit():
	player.hit = false
	player.gets_hit_by = ""
	
func Physics_Update(delta: float):
	if player.gets_hit_by == "Enemy":
		player.hp -= 2
	
	if player.gets_hit_by == "Boss":
		player.hp -= 10
	
	if player.hp <= 0:
		Transitioned.emit(self, "death")
	else:
		Transitioned.emit(self, "idle")
