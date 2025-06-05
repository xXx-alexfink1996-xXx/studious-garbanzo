extends Node


# Returns float between [-1, 1]
# Positive is right, Negative is left.
func get_movement_direction() -> float:
	return Input.get_axis("left", "right")


#func is_movement_input_held() -> bool:
	#if Input.is_action_pressed("left") || Input.is_action_pressed("right"):
		#return true
	#return false
