class_name BossState
extends Node

## The first child state to activate when entering this state.
## Leave empty to use the first child that is a BossState.
@export var initial_child: NodePath

var machine: BossHFSM
var boss: CharacterBody2D


func setup(hfsm: BossHFSM, controlled_boss: CharacterBody2D) -> void:
	machine = hfsm
	boss = controlled_boss


func enter() -> void:
	print("Enter: ", get_path())


func exit() -> void:
	print("Exit: ", get_path())


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func get_initial_child() -> BossState:
	if not initial_child.is_empty():
		var node := get_node_or_null(initial_child)
		if node is BossState:
			return node

	for child in get_children():
		if child is BossState:
			return child

	return null


func transition_to(target: BossState) -> void:
	if machine != null:
		machine.transition_to(target)
