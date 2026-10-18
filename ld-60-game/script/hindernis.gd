extends StaticBody2D

@onready var been_hit = false
@onready var collider = self.get_child(2)
@onready var area = self.get_child(1)
@onready var sprite = self.get_child(0)


func _on_hind_area_area_entered(area: Area2D) -> void:
	if been_hit == false:
		collider.disabled = true
		self.set_collision_layer_value(2,false)
		#self.set_collision_mask_value(4,false)
		been_hit = true
		sprite.play("hit")
		$LightOccluder2D.occluder_light_mask = 2
