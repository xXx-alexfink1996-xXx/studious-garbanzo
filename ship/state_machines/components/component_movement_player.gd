extends Node


# Returns float between [-1, 1]
# Positive is right, Negative is left.
func get_movement_direction() -> float:
	return Input.get_axis("left", "right")
