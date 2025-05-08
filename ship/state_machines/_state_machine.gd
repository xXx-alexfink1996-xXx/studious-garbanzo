class_name StateMachine
extends Node

@export var starting_state: State

var current_state: State

#func _process(delta: float) -> void:
	#print(current_state)


func base_init(
	parent: CharacterBody2D,
	sprite_animations: AnimatedSprite2D,
	data_store_component,
) -> void:
	for child in get_children():
		child.parent = parent
		child.sprite_animations = sprite_animations
		child.data_store_component = data_store_component
	
	change_state(starting_state)


func change_state(
	new_state: State,
) -> void:
	current_state = new_state
	current_state.enter()


func process_physics(delta: float) -> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)


func process_input(event: InputEvent) -> void:
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)


func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
