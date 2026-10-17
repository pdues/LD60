extends State
class_name playerMovement

@export var player: CharacterBody2D
@export var MOVESPEED: float = 100.0
@export var hitbox_offset : float

var hitbox_player : CollisionShape2D

func Enter():
	hitbox_player = player.get_children(true)[2].get_child(0)

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
	if player.velocity.x > 0:
		hitbox_player.position.x = hitbox_offset
	else:
		hitbox_player.position.x = -hitbox_offset
