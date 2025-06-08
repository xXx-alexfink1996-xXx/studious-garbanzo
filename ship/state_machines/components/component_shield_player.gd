extends Node

@export var shield_cooldown_start_time: float = 0.6
var shield_cooldown_timer: float


func _process(delta: float) -> void:
	if shield_cooldown_timer > 0:
		shield_cooldown_timer -= delta


func wants_to_shield() -> bool:
	return Input.is_action_pressed("shield")


func can_shield() -> bool:
	if shield_cooldown_timer <= 0:
		return true
	return false


func reset_shield_cooldown(cooldown: float) -> void:
	shield_cooldown_timer = cooldown
