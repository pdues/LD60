extends State
class_name playerPunch

@onready var hitbox_punch: CollisionShape2D
@export var player: CharacterBody2D

var punch_cd = 0.5
var punch_timer = 0.0
var box_dir = 15


func Enter():
	hitbox_punch = get_tree().get_first_node_in_group("Hitbox")
	hitbox_punch.disabled = false
	#print("punch")
	
func Physics_Update(delta: float):
	if player.velocity.x > 0:
		#print("1")
		hitbox_punch.position.x = box_dir
	elif player.velocity.x < 0:
		#print("0")
		hitbox_punch.position.x = -box_dir
	player.velocity.x = 0
	punch_timer += delta
	if punch_timer >= punch_cd:
		punch_timer = 0.0
		hitbox_punch.disabled = true
		Transitioned.emit(self, "playerIdle")

func Exit():
	print("end punch")
