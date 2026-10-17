extends State
class_name playerIdle

@export var player: CharacterBody2D

func Enter():
	player.velocity.x=0.0

func Physics_Update(_delta: float):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction !=0:
		Transitioned.emit(self, "playerMovement")
