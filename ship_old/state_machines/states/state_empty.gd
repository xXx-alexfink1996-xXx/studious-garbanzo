extends StateCombat

@export var idle_state: State


func process_frame(delta: float) -> State:
	return idle_state
