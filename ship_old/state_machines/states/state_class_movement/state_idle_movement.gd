extends StateMovement

@export var move_state: State


func enter() -> void:
	super()
	parent.velocity.x = 0


func process_input(event: InputEvent) -> State:
	if get_movement_input():
		return move_state
	return null
