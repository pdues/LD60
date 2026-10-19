extends State
class_name PlayerIFrame

@export var player : CharacterBody2D

var time_elapsed : float = 0.0

func Enter():
	time_elapsed = 0.0
	player.can_get_hit = false
	
func Physics_Update(delta: float):
	time_elapsed += delta
	
	if player.can_get_hit || time_elapsed >= player.i_frames:
		return
		
func Exit():
	player.can_get_hit = true
