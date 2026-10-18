extends State
class_name playerPunch

@onready var hitbox_punch: CollisionShape2D
@export var player: CharacterBody2D

var punch_cd = 0.5
var punch_timer = 0.0

func Enter():
	hitbox_punch = player.get_children(true)[2].get_child(0)
	hitbox_punch.disabled = false
	
func Physics_Update(delta: float):
	if player.hit == true:
		Transitioned.emit(self, "hurt")
		
	player.velocity.x = 0
	punch_timer += delta
	if punch_timer >= punch_cd:
		punch_timer = 0.0
		hitbox_punch.disabled = true
		Transitioned.emit(self, "idle")

func Exit():
	print("end punch")
