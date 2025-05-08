extends Node

@export var shield_cooldown_start_time: float = 0.6
var shield_cooldown_timer: float


func _process(delta: float) -> void:
	if shield_cooldown_timer > 0:
		#shield_cooldown_timer = decrement_and_stop_at_zero(shield_cooldown_timer, delta)
		shield_cooldown_timer -= delta


func return_shield_cooldown_start_time() -> float:
	return shield_cooldown_start_time


func set_shield_cooldown_timer(cooldown_timer: float) -> void:
	shield_cooldown_timer = cooldown_timer


func when_shield_cooldown_timer() -> float:
	return shield_cooldown_timer


func is_shield_button_pressed() -> bool:
	return Input.is_action_just_pressed("shield")


func is_shield_button_held() -> bool:
	return Input.is_action_pressed("shield")


func is_shield_button_released() -> bool:
	return Input.is_action_just_released("shield")


func wants_to_shield() -> bool:
	return Input.is_action_pressed("shield")


func can_shield() -> bool:
	if shield_cooldown_timer <= 0:
		return true
	return false


func reset_shield_cooldown(cooldown: float) -> void:
	shield_cooldown_timer = cooldown
