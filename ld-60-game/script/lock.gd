extends Area2D
var turnstates =  [0,1,2,3]
@onready var Pic = self.get_child(0)
@export var curr_turnstate = 0
var time_since_turn = 0.5
var time_elapsed = 0.0
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(delta: float) -> void:
	time_elapsed += delta
	for body in self.get_overlapping_bodies():
		if body.is_in_group("Player") == true:
			if Input.is_physical_key_pressed(KEY_E) == true and time_elapsed > time_since_turn :
				if curr_turnstate == 3:
					curr_turnstate = 0
				else:
					curr_turnstate = turnstates[curr_turnstate + 1]
				Pic.global_rotation = curr_turnstate * deg_to_rad(90.0)
				time_elapsed = 0.0



	
