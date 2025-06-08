extends StateCombat

@export var shield_active_state: State
@export var shield_deactivated_state: State

func enter() -> void:
	super()
	#3 frames at 5fps
	#get_set_shield_cooldown_timer(get_shield_cooldown_start_time())
	get_reset_shield_cooldown(parent.shield_cooldown)


func process_physics(delta: float) -> State:
	if get_can_shield():
		if get_shield():
			return shield_active_state
		return shield_deactivated_state
	return null
	
