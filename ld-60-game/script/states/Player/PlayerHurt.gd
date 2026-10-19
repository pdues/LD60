extends State
class_name PlayerHurt

@export var player : CharacterBody2D
@export var hp_bar : TextureProgressBar
@onready var max_hp = 10

func Exit():
	player.hit = false
	
func Physics_Update(delta: float):
	player.hp -= 1
	
	hp_bar.value = player.hp
	
	if player.hp == 0:
		Transitioned.emit(self, "death")
	else:
		Transitioned.emit(self, "idle")
