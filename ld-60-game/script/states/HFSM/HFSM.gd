class_name BossHFSM
extends Node

@export var boss: CharacterBody2D
@export var start_state: BossState

## Root-to-leaf list of currently active states.
var active_path: Array[BossState] = []

var pending_transition: BossState = null
var is_transitioning := false


func _ready() -> void:
	if boss == null:
		push_error("BossHFSM: Assign the boss node.")
		set_physics_process(false)
		return

	# Give every state access to the machine and the boss.
	_setup_states(self)

	if start_state == null:
		push_error("BossHFSM: Assign a Start State.")
		set_physics_process(false)
		return

	_enter_branch(start_state)


func _setup_states(node: Node) -> void:
	for child in node.get_children():
		if child is BossState:
			child.setup(self, boss)
		_setup_states(child)


func _enter_branch(state: BossState) -> void:
	active_path.append(state)
	state.enter()

	var child := state.get_initial_child()
	if child != null:
		_enter_branch(child)


func transition_to(target: BossState) -> void:
	if target == null:
		push_error("Transition target is null!")
		return

	print("Transition requested: ", target.get_path())
	pending_transition = target


func _physics_process(delta: float) -> void:
	var path_snapshot := active_path.duplicate()

	for state in path_snapshot:
		if not active_path.has(state):
			continue

		state.physics_update(delta)

	if pending_transition != null:
		var target := pending_transition
		pending_transition = null
		_apply_transition(target)


#func _process(delta: float) -> void:
	#var path_snapshot := active_path.duplicate()
#
	#for state in path_snapshot:
		#if not active_path.has(state):
			#continue
		#state.update(delta)
#
	#if pending_transition != null:
		#var target := pending_transition
		#pending_transition = null
		#_apply_transition(target)



func _apply_transition(target: BossState) -> void:
	print("Applying transition to: ", target.get_path())
	print("Current active path: ", active_path)
	
	if is_transitioning or target == null:
		return

	# Build the path from the HFSM root to the target.
	var target_path: Array[BossState] = []
	var node: Node = target

	while node != null and node != self:
		if not node is BossState:
			push_error("Target is not inside the HFSM.")
			return

		target_path.push_front(node)
		node = node.get_parent()

	if node != self:
		push_error("Target state belongs to a different HFSM.")
		return

	is_transitioning = true

	# Find the common prefix of the active and target paths.
	var common := 0
	while (
		common < active_path.size()
		and common < target_path.size()
		and active_path[common] == target_path[common]
	):
		common += 1

	# If the target is already active and is an ancestor,
	# exit that target too, so it can be entered again.
	if target in active_path and target_path.back() == target:
		common = target_path.size() - 1

	# Exit states from leaf toward the common ancestor.
	for i in range(active_path.size() - 1, common - 1, -1):
		active_path[i].exit()

	active_path.resize(common)

	# Enter target branch from parent toward leaf.
	# Do NOT automatically enter descendants here.
	for i in range(common, target_path.size()):
		var state := target_path[i]
		active_path.append(state)
		state.enter()

	is_transitioning = false



func get_current_state() -> BossState:
	if active_path.is_empty():
		return null
	return active_path.back()
