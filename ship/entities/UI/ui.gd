extends Control

@onready var score_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/ScoreLabel
@onready var time_label: Label = $MarginContainer/VBoxContainer/HBoxContainer/TimeLabel

var score: int
var time: float


func _ready() -> void:
	score = 0


func _process(delta: float) -> void:
	time -= delta * 2
	
	score_label.text = "Score: %d" %score
	time_label.text = "Time: %03d" %time


func score_update(points: int) -> void:
	score += points


func set_time_limit(time_limit: float) -> void:
	time = time_limit
