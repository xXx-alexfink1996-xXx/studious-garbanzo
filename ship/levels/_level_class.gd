class_name Level
extends Node

@export var ui: Control


func _ready() -> void:
	var enemy = get_node("EnemyBasic")
	enemy.enemy_died.connect(_update_score)


func _update_score(points: int) -> void:
	ui.score_update(points)
