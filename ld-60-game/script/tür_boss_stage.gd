extends StaticBody2D

@export var lock: Area2D
@export var collider: CollisionShape2D
@export var lamp: PointLight2D
var open = 0


func _on_lock_activated() -> void:
	open = 1
	self.set_collision_layer_value(2,false)
	lamp.enabled  = false
