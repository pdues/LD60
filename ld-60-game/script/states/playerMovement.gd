extends State
class_name playerMovement

@export var player: CharacterBody2D
@export var MOVESPEED: float = 100.0


func Physics_Update(_delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 0:
		Transitioned.emit(self, "playerIdle")
		return
	if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
		Transitioned.emit(self, "playerJump")
	if Input.is_action_just_pressed("ui_select"):
		Transitioned.emit(self, "playerPunch")
	
	player.velocity.x = direction * MOVESPEED
