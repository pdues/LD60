extends Node2D
@export var on = 0
@onready var area = $Area2D
@onready var sprite = $AnimatedSprite2D
@onready var lamp = $PointLight2D1
var time_elasped = 0.0

func _physics_process(delta: float) -> void:
	if time_elasped > 3.0:
		get_tree().change_scene_to_file("res://scene/Levels/Intro.tscn")
	
	if on == 0:
		sprite.play("off")
		lamp.enabled = false
		time_elasped += delta
	
	for body in area.get_overlapping_bodies():
		if body.is_in_group("Player") == true:
			if Input.is_physical_key_pressed(KEY_E) == true and on == 1:
				sprite.play("off")
				on = 0
				lamp.enabled = false
