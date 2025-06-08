extends StateCombat

@export var idle_state: State
@export var shield_activated_state: State


func enter() -> void:
	super()
	#3 frames at 5fps
	get_reset_shield_cooldown(parent.shield_cooldown)


func process_physics(delta: float) -> State:
	if get_can_shield():
		if get_shield():
			return shield_activated_state
		return idle_state
	
	return null
