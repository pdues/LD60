extends StaticBody2D

@onready var locks =[$Lock1]
@onready var door = $"TÜR_coll"
@onready var animation = $AnimationPlayer


@onready var open = false
@onready var opened = true
var shift = 100
func _process(delta: float) -> void:
	if locks[0].curr_turnstate == 1 :
		open = true
	else:
		open = false
		
	if open == true and opened == false:
		$AnimationPlayer.play("door slide")
		opened = true
	
	if open == false and opened == true:
		$AnimationPlayer.play("door lock")
		opened = false
		
