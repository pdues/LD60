extends State
class_name PlayerPunch

@onready var hitbox_punch: CollisionShape2D
@export var player: CharacterBody2D
@onready var animated_sprite = player.get_child(1)

var punch_cd = 0.5
var punch_end = 0.4
var punch_timer = 0.0

func Enter():
	hitbox_punch = player.get_children(true)[2].get_child(0)
	#hitbox_punch.disabled = false
	
func Physics_Update(delta: float):
	if player.hit == true:
		Transitioned.emit(self, "hurt")
		
	player.velocity.x = 0
	punch_timer += delta
	if player.dir == "right":
		if punch_timer<0.1:
			animated_sprite.play("pre_slash_r")
		if punch_timer > 0.1 and punch_timer < punch_end:
			hitbox_punch.disabled = false
			player.get_child(1).position.x = 16
			animated_sprite.play("slash_r")
		if punch_timer > punch_end and punch_timer < punch_cd:
			hitbox_punch.disabled = true
			player.get_child(1).position.x = 0
			animated_sprite.play("post_slash_r")
		if punch_timer >= punch_cd:
			punch_timer = 0.0
			Transitioned.emit(self, "idle")
			
	if player.dir == "left":
		if punch_timer<0.1:
			animated_sprite.play("pre_slash_l")
		if punch_timer > 0.1 and punch_timer < punch_end:
			hitbox_punch.disabled = false
			player.get_child(1).position.x = -16
			animated_sprite.play("slash_l")
		if punch_timer > punch_end and punch_timer < punch_cd:
			hitbox_punch.disabled = true
			player.get_child(1).position.x = 0
			animated_sprite.play("post_slash_l")
		if punch_timer >= punch_cd:
			punch_timer = 0.0
			Transitioned.emit(self, "idle")


func Exit():
	print("end punch")
