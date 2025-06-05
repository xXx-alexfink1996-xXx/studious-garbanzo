extends StateCombat

#@export var shoot_state: State
@onready var shoot_state: Node = $"../Shoot2"

@export var shield_activated_state: State


func enter() -> void:
	super()
	print(shoot_state, parent)


func process_physics(delta: float) -> State:
	#if get_is_shoot_button_pressed() || get_is_shoot_button_held():
	if get_shoot():
		return shoot_state
	
	#if get_is_shield_button_pressed() || get_is_shield_button_held():
	if get_shield():
		return shield_activated_state
	
	return null
