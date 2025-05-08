extends Node

@export var bullet_cooldown_start_time: float = 0.5
@export var bullet_cooldown_time: float = 0.4
var bullet_cooldown_timer: float


func _process(delta: float) -> void:
	if bullet_cooldown_timer > 0:
		#bullet_cooldown_timer = decrement_and_stop_at_zero(bullet_cooldown_timer, delta)
		bullet_cooldown_timer -= delta


func set_bullet_cooldown_timer_to_start_time() -> void:
	bullet_cooldown_timer = bullet_cooldown_start_time


func set_bullet_cooldown_timer_to_cooldown_time() -> void:
	bullet_cooldown_timer = bullet_cooldown_time


func when_bullet_cooldown_timer() -> float:
	return bullet_cooldown_timer


func is_shoot_button_pressed() -> bool:
	return Input.is_action_just_pressed("shoot")


func is_shoot_button_held() -> bool:
	return Input.is_action_pressed("shoot")


func wants_to_shoot() -> bool:
	return Input.is_action_pressed("shoot")


func can_shoot() -> bool:
	if bullet_cooldown_timer <= 0:
		return true
	return false


func reset_shoot_cooldown(cooldown: float) -> void:
	bullet_cooldown_timer = cooldown
