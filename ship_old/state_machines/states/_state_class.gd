class_name State
extends Node

@export var animation_name: String

var parent: CharacterBody2D
var sprite_animations: AnimatedSprite2D

var data_store_component


func enter() -> void:
	if animation_name != "none":
		sprite_animations.play(animation_name)


func exit() -> void:
	pass


func process_input(event: InputEvent) -> State:
	return null


func process_frame(delta: float) -> State:
	return null


func process_physics(delta: float) -> State:
	return null
