extends StaticBody2D

@onready var locks =[$Lock1,$Lock2,$Lock3,$Lock4]
@onready var door = $"TÜR_coll"


var open = false
var opened = false
var shift = 100
func _process(delta: float) -> void:
	if locks[0].curr_turnstate == 1 and locks[1].curr_turnstate == 1 and locks[2].curr_turnstate == 1 and locks[3].curr_turnstate == 1 :
		open = true
	else:
		open = false
		
	if open == true and opened == false:
		door.position += Vector2(0,1*shift)
		opened = true
	
	if open == false and opened == true:
		door.position += Vector2(0,-1*shift)
		opened = false
		
