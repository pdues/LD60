extends State
class_name playerJump

@export var player: CharacterBody2D
@export var JUMPHEIGHT: float = -400.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func Enter():
	player.velocity.y = JUMPHEIGHT
	print("jump")


func Physics_Update(delta: float) -> void:
	if player.velocity.y !=0:
		player.velocity.y += gravity * delta
	if player.velocity.y == 0:
		Transitioned.emit(self, "playerIdle")
