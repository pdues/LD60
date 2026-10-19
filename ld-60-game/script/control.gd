extends Control

@onready var msg_label: Label = $Label

var cd=false

func _ready() -> void:
	msg_label.text = "Damn, I'm not hurt... but goddammit, now I've done it. I just had to get too close to that hole."

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_select") and not cd:
		if msg_label.text.begins_with("Damn"):
			msg_label.text = "But were does this light come from? It wasn't glowing when i was up there..."
			cd =true
			await get_tree().create_timer(0.5).timeout
			cd=false
		else:
			get_tree().change_scene_to_file("res://scene/Levels/Level1.tscn")
