extends StateCombat

@export var shield_deactivated_state: State

func enter() -> void:
	super()


func process_input(event: InputEvent) -> State:
	if !get_shield():
		return shield_deactivated_state
	return null
