extends Area2D
var turnstates =  [0,1]
@onready var Pic = self.get_child(0)
@export var curr_turnstate = 0
@onready var sprite = self.get_child(0)
var time_since_turn = 0.5
var time_elapsed = 0.0
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("Lichtray") == true :
		if curr_turnstate == 0:
			curr_turnstate = 1
			sprite.play("on")
		else:
			curr_turnstate = 0
			sprite.play("off")
		time_elapsed = 0.0
