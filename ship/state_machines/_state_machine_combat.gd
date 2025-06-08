extends StateMachine


func init(
	parent: CharacterBody2D,
	sprite_animations: AnimatedSprite2D,
	data_store_component,
	shoot_component,
	shield_component,
) -> void:
	base_init(parent, sprite_animations, data_store_component)
	
	for child in get_children():
		child.shoot_component = shoot_component
		child.shield_component = shield_component
