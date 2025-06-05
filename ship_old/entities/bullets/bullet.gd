extends StaticBody2D

@export var speed : int = -300
@export var anim : String = "default"

@onready var sprite_animations: AnimatedSprite2D = $AnimatedSprite2D


func _ready() -> void:
	sprite_animations.play(anim)


func _physics_process(delta: float) -> void:
	position.y += speed * delta
