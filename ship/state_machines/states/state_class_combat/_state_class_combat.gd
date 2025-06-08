class_name StateCombat
extends State

var shoot_component
var shield_component


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
