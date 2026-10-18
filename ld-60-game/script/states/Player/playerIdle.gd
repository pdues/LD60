extends State
class_name playerIdle

@export var player: CharacterBody2D
@onready var animated_sprite = player.get_child(1)

func Enter():
	if player.dir == "right":
		animated_sprite.play("Idle_right")
	elif player.dir == "left":
		animated_sprite.play("Idle_left")
	player.velocity.x=0.0


func Physics_Update(_delta: float):
	if player.hit == true:
		Transitioned.emit(self, "hurt")
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		Transitioned.emit(self, "movement")
		
	if Input.is_action_just_pressed("ui_up") and player.is_on_floor():
		Transitioned.emit(self, "jump")
	if Input.is_action_just_pressed("ui_select"):
		Transitioned.emit(self, "punch")
		
