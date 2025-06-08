class_name StateMovement
extends State

var move_component


func get_movement_input() -> float:
	return move_component.get_movement_direction()
