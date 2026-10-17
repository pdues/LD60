extends State
class_name playerMovement

@export var player: CharacterBody2D
@export var MOVESPEED: float = 100.0
@export var hitbox_offset : float
@onready var animated_sprite = player.get_child(1)
@onready var licht = $"../../Licht"
var hitbox_player : CollisionShape2D

func Enter():
	hitbox_player = player.get_children(true)[2].get_child(0)

func Physics_Update(_delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction < 0:
		animated_sprite.play("run_left")
		player.dir ="left"
		licht.dir = "left"
	elif direction > 0:
		animated_sprite.play("run_right")
		player.dir ="right"
		licht.dir ="right"
	if direction == 0:
		Transitioned.emit(self, "playerIdle")
		return
	if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
		Transitioned.emit(self, "playerJump")
	if Input.is_action_just_pressed("ui_select"):
		Transitioned.emit(self, "playerPunch")
	
	player.velocity.x = direction * MOVESPEED
	if player.dir == "right":
		hitbox_player.position.x = hitbox_offset
	elif player.dir == "left":
		hitbox_player.position.x = -hitbox_offset
