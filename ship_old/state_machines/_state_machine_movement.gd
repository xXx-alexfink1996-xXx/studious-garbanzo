extends StateMachine


func init(
	parent: CharacterBody2D,
	sprite_animations: AnimatedSprite2D,
	data_store_component,
	move_component,
) -> void:
	base_init(parent, sprite_animations, data_store_component)
	
	for child in get_children():
		child.move_component = move_component
