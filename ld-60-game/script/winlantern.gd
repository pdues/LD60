extends Node2D
@export var on = 1
@onready var area = $Area2D
@onready var sprite = $AnimatedSprite2D
@onready var lamp = $PointLight2D1


func _physics_process(delta: float) -> void:
	if on == 0:
		sprite.play("off")
		lamp.enabled = false
	
	for body in area.get_overlapping_bodies():
		if body.is_in_group("Player") == true:
			if Input.is_physical_key_pressed(KEY_E) == true and on == 1:
				sprite.play("off")
				on = 0
				lamp.enabled = false
