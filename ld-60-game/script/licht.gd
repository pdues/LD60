extends Node2D

var toggle = 0
var time_elapsed = 1.0
var time = 0.0
var normal_lich
@onready var pickup = 0
@export var dir = "right"

func _physics_process(delta: float) -> void:
	if dir == "right":
		self.rotation = 0
	else:
		self.rotation = deg_to_rad(180)

func _process(delta: float) -> void:
	time += delta

	if Input.is_physical_key_pressed(KEY_G) and time > time_elapsed and pickup == 1:
		$normal_schirm.hide()
		$normal_licht.hide()
		$beam_schirm.show()
		$beam_licht.show()
		$beam_ray.show()
		$beam_ray/beam_collider.set_deferred("disabled",false)
		toggle = 0
		time = 0.0
			
	if toggle == 0 and time > time_elapsed:
		$normal_schirm.show()
		$normal_licht.show()
		$beam_schirm.hide()
		$beam_licht.hide()
		$beam_ray.hide()
		$beam_ray/beam_collider.set_deferred("disabled",true)
		toggle = 0
		


func _on_pickup_area_area_entered(area: Area2D) -> void:
	print("in")
	if area.is_in_group("pickup") == true:
		pickup = 1
		
