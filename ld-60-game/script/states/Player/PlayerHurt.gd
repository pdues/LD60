extends State
class_name PlayerHurt

@export var player : CharacterBody2D
	
func Exit():
	player.hit = false
	
func Physics_Update(delta: float):
	player.hp -= 1
	
	if player.hp == 0:
		Transitioned.emit(self, "death")
	else:
		Transitioned.emit(self, "idle")
