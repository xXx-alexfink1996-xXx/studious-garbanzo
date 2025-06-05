class_name StateCombat
extends State

var shoot_component
var shield_component


func get_set_bullet_cooldown_timer_to_start_time() -> void:
	shoot_component.set_bullet_cooldown_timer_to_start_time()


func get_set_bullet_cooldown_timer_to_cooldown_time() -> void:
	shoot_component.set_bullet_cooldown_timer_to_cooldown_time()


func get_when_bullet_cooldown_timer() -> float:
	return shoot_component.when_bullet_cooldown_timer()


func get_is_shoot_button_pressed() -> bool:
	return shoot_component.is_shoot_button_pressed()


func get_is_shoot_button_held() -> bool:
	return shoot_component.is_shoot_button_held()


func get_shield_cooldown_start_time() -> float:
	return shield_component.return_shield_cooldown_start_time()


func get_set_shield_cooldown_timer(cooldown_timer: float) -> void:
	return shield_component.set_shield_cooldown_timer(cooldown_timer)


func get_when_shield_cooldown_timer() -> float:
	return shield_component.when_shield_cooldown_timer()


func get_is_shield_button_pressed() -> bool:
	return shield_component.is_shield_button_pressed()


func get_is_shield_button_held() -> bool:
	return shield_component.is_shield_button_held()


func get_is_shield_button_released() -> bool:
	return shield_component.is_shield_button_released()


func get_shoot() -> bool:
	return shoot_component.wants_to_shoot()


func get_can_shoot() -> bool:
	return shoot_component.can_shoot()


func get_reset_shoot_cooldown(cooldown: float) -> void:
	shoot_component.reset_shoot_cooldown(cooldown)


func get_shield() -> bool:
	return shield_component.wants_to_shield()


func get_can_shield() -> bool:
	return shield_component.can_shield()


func get_reset_shield_cooldown(cooldown: float) -> void:
	shield_component.reset_shield_cooldown(cooldown)
