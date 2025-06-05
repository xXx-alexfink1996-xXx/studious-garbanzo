extends Node

@export var shield_cooldown_start_time: float = 0.6
var shield_cooldown_timer: float

@export var bullet_cooldown_start_time: float = 0.5
@export var bullet_cooldown_time: float = 0.4
var bullet_cooldown_timer: float


func _process(delta: float) -> void:
	if shield_cooldown_timer > 0:
		#shield_cooldown_timer = decrement_and_stop_at_zero(shield_cooldown_timer, delta)
		shield_cooldown_timer -= delta
	
	if bullet_cooldown_timer > 0:
		#bullet_cooldown_timer = decrement_and_stop_at_zero(bullet_cooldown_timer, delta)
		bullet_cooldown_timer -= delta


#func decrement_and_stop_at_zero(value: float, delta: float) -> float:
	#value -= delta
	#if value < 0:
		#return 0
	#return value


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
