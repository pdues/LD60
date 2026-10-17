extends StaticBody2D

@onready var been_hit = false
@onready var collider = self.get_child(2)
@onready var area = self.get_child(1)
@onready var sprite = self.get_child(0)

func _on_hind_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	if been_hit == false:
		collider.disabled = true
		self.set_collision_layer_value(1,false)
		been_hit = true
		sprite.play("broken")
		$LightOccluder2D.occluder_light_mask = 2
