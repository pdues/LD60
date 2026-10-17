extends State
class_name playerMovement

@export var player: CharacterBody2D
@export var MOVESPEED: float = 100.0

func Physics_Update(_delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")

	if direction == 0:
		Transitioned.emit(self, "playerIdle")
		return

	player.velocity.x = direction * MOVESPEED
