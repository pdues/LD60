extends Node2D

var toggle = 0
var time_elapsed = 3.0
var time = 0.0
var normal_lich

func _process(delta: float) -> void:
	time += delta

	if Input.is_physical_key_pressed(KEY_G) and time > time_elapsed:
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
		
