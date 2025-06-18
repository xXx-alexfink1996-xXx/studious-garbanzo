class_name Level
extends Node

@export var ui: Control
@export var time_limit: float


func _ready() -> void:
	var enemy = get_node("EnemyBasic")
	enemy.enemy_died.connect(_update_score)
	
	ui.set_time_limit(time_limit)


func _update_score(points: int) -> void:
	ui.score_update(points)
