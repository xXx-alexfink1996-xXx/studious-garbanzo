extends Node

@export var main: PackedScene 


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("shoot"):
		_go_to_main()


func _on_button_pressed() -> void:
	_go_to_main()


func _go_to_main() -> void:
	get_tree().change_scene_to_packed(main)
