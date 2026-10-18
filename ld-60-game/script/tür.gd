extends StaticBody2D

@onready var locks =[$Lock1,$Lock2,$Lock3,$Lock4]
@onready var door = $"TÜR_coll"
@export  var code = [0,0,0,0]



var open = false
var opened = false
var shift = 100
func _process(delta: float) -> void:
	if locks[0].curr_turnstate == code[0] and locks[1].curr_turnstate == code[1]  and locks[2].curr_turnstate == code[2]  and locks[3].curr_turnstate == code[3] :
		open = true
	else:
		open = false
		
	if open == true and opened == false:
		$AnimationPlayer.play("door slide")
		opened = true
	
	if open == false and opened == true:
		$AnimationPlayer.play("door close")
		opened = false
		
