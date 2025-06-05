extends Node

@export var bullet_cooldown_time: float = 0.4
var bullet_cooldown_timer: float


func _process(delta: float) -> void:
	if bullet_cooldown_timer > 0:
		#bullet_cooldown_timer = decrement_and_stop_at_zero(bullet_cooldown_timer, delta)
		bullet_cooldown_timer -= delta


func wants_to_shoot() -> bool:
	return true


func can_shoot() -> bool:
	if bullet_cooldown_timer <= 0:
		return true
	return false


func reset_shoot_cooldown(cooldown: float) -> void:
	bullet_cooldown_timer = cooldown
