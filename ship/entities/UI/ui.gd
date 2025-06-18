extends Control

@onready var score_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/ScoreLabel

func _ready() -> void:	
	var enemy = get_node("EnemyBasic")
	enemy.enemy_died.connect(_update_score)


func _update_score() -> void:
	print("hello")
