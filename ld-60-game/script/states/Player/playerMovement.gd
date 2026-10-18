extends State
class_name PlayerMovement

@export var player: CharacterBody2D
@export var MOVESPEED: float = 100.0
@export var JUMPHEIGHT: float = -300.0
@export var hitbox_offset : float
@onready var animated_sprite = player.get_child(1)
@onready var licht = $"../../Licht"
var hitbox_player : CollisionShape2D

func Enter():
	hitbox_player = player.get_children(true)[2].get_child(0)

func Physics_Update(_delta: float) -> void:
	if player.hit == true:
		Transitioned.emit(self, "hurt")
		
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction < 0 and player.is_on_floor():
		animated_sprite.play("run_left")
		player.dir ="left"
		licht.dir = "left"
	elif direction > 0 and player.is_on_floor():
		animated_sprite.play("run_right")
		player.dir ="right"
		licht.dir ="right"
	elif player.dir =="left" and player.velocity.y != 0.0:
		animated_sprite.play("jump_left")
	elif player.dir =="right" and player.velocity.y != 0.0:
		animated_sprite.play("jump_right")
	
	if player.velocity == Vector2(0.0,0.0) and not Input.is_action_pressed("ui_up"):
		Transitioned.emit(self, "idle")
		
	
	if Input.is_action_pressed("ui_up") and player.is_on_floor():
		player.velocity.y = JUMPHEIGHT
		
	if Input.is_action_just_pressed("ui_select"):
		Transitioned.emit(self, "punch")
	
	player.velocity.x = direction * MOVESPEED
	if player.dir == "right":
		hitbox_player.position.x = hitbox_offset
	elif player.dir == "left":
		hitbox_player.position.x = -hitbox_offset
