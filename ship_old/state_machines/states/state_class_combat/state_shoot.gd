extends StateCombat

@export var idle_state: State
@export var shield_activated: State


func enter() -> void:
	super()


func process_physics(delta: float) -> State:
	#if get_is_shield_button_pressed():
		#return shield_activated
	
	if get_shield():
		return shield_activated
	
	#if get_is_shoot_button_pressed():
		#shoot_and_set()
	
	if get_can_shoot():
		if !get_shoot():
			return idle_state
		shoot()
		get_reset_shoot_cooldown(parent.bullet_cooldown)
	return null


func shoot() -> void:
	var bullet = parent.bullet.instantiate()
	parent.owner.add_child(bullet)
	bullet.position = parent.global_position + Vector2(0, 10)


func shoot_and_set() -> void:
	shoot()
	get_set_bullet_cooldown_timer_to_start_time()
