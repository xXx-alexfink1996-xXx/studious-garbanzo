extends StateMovement

@export var idle_state: State


func enter() -> void:
	super()


func process_physics(delta: float) -> State:
	var movement = get_movement_input() * parent.active_move_speed
	
	if movement == 0:
		return idle_state
	
	parent.velocity.x = movement
	
	return null
