extends StateCombat

@export var idle_state: State
@export var shield_activated: State


func enter() -> void:
	super()


func process_physics(delta: float) -> State:
	if get_shield():
		return shield_activated
	
	if get_can_shoot():
		if !get_shoot():
			return idle_state
		shoot()
		get_reset_shoot_cooldown(parent.bullet_cooldown)
	return null


func shoot() -> void:
	var bullet = parent.bullet.instantiate()
	parent.owner.add_child(bullet)
	bullet.position = parent.global_position + (Vector2(0, 10) * parent.facing_direction)
