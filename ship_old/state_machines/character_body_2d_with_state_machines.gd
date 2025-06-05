class_name CharacterBody2DWithStateMachines
extends CharacterBody2D

var active_state_machines: Array[StateMachine] = []


func _to_state_machine_unhandled_input(event: InputEvent) -> void:
	for state_machine in active_state_machines:
		#checking if the SM exists allows it to be removed
		if state_machine:
			state_machine.process_input(event)


func _to_state_machine_physics_process(delta: float) -> void:
	for state_machine in active_state_machines:
		#checking if the SM exists allows it to be removed
		if state_machine:
			state_machine.process_physics(delta)


func _to_state_machine_process(delta: float) -> void:
	for state_machine in active_state_machines:
		#checking if the SM exists allows it to be removed
		if state_machine:
			state_machine.process_frame(delta)


func activate_state_machine(state_machine: StateMachine) -> void:
	if active_state_machines.has(state_machine):
		print("ERROR: Already an active state machine with that name.")
		return
	
	active_state_machines.append(state_machine)


func deactivate_state_machine(state_machine: StateMachine) -> void:
	if !active_state_machines.has(state_machine):
		print("ERROR: No active state machine with that name.")
		return
	
	active_state_machines.erase(state_machine)
