extends StateMovement

@export var idle_state: State


func enter() -> void:
	super()


func process_physics(delta: float) -> State:
	var movement = get_movement_input() * parent.move_speed
	
	#if movement == 0 && !get_is_movement_input_held():
	if movement == 0:
		return idle_state
	
	parent.velocity.x = movement
	parent.move_and_slide()
	
	return null
