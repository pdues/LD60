extends Resource
class_name ObjectStats

signal death()

@export var max_health : int = 100
@export var current_health : int = 100 :
	set(value):
		var old = current_health
		current_health = value
		
		if old > 0 && current_health <= 0:
			death.emit()
