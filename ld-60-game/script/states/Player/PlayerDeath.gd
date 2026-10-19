extends State
class_name PlayerDeath

@export var player : CharacterBody2D
var scene = preload("res://scene/leiche.tscn")
var instance = scene.instantiate()



func Enter():
	#play death animation
	#create corpse entity
	get_tree().get_root().add_child(instance)
	instance.position = player.position
	player.hp = 1
	player.position = player.respawnpoint.position
	
func Physics_Update(_delta: float):
	Transitioned.emit(self, "idle")
