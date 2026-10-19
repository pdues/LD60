extends Area2D


@export var sprite: AnimatedSprite2D
@export var lamp: PointLight2D

@onready var on = 0

signal  activated

func _physics_process(delta: float) -> void:
	if on == 1:
		sprite.play("on")
		lamp.enabled = true
	
	for body in self.get_overlapping_bodies():
		if body.is_in_group("Player") == true:
			if Input.is_physical_key_pressed(KEY_E) == true and on == 0:
				on = 1
				emit_signal("activated")
