extends State
class_name PlayerDeath

@export var player : CharacterBody2D

func Enter():
	#play death animation
	#create corpse entity
	player.queue_free() #change to respawn later on
