class_name Player
extends CharacterBody2DWithStateMachines

@onready var sprite_animations: AnimatedSprite2D = $SpriteAnimations

@onready var movement_state_machine = $MovementStateMachine2
@onready var combat_state_machine: Node = $CombatStateMachine

@onready var move_component: Node = $ComponentMovementPlayer
@onready var shoot_component: Node = $ComponentShootPlayer
@onready var shield_component: Node = $ComponentShieldPlayer
@onready var data_store_component: Node = $ComponentDataStore

@export var bullet : PackedScene

@export var move_speed: float = 100
@export var bullet_cooldown: float = 0.4
@export var shield_cooldown: float = 0.6

const bullet_collision_layer: int = 0b1000


func _ready() -> void:
	facing_direction = UP
	
	movement_state_machine.init(
		self,
		sprite_animations,
		data_store_component,
		move_component
	)
	combat_state_machine.init(
		self,
		sprite_animations,
		data_store_component,
		shoot_component,
		shield_component,
	)
	
	active_state_machines = [combat_state_machine]
	
	position.x = get_viewport_rect().size.x / 2


func _unhandled_input(event: InputEvent) -> void:
	_to_state_machine_unhandled_input(event)
	
	if Input.is_action_just_pressed("ui_end"):
		die()
	
	if Input.is_action_just_pressed("ui_home"):
		activate_state_machine(movement_state_machine)


func _physics_process(delta: float) -> void:
	_to_state_machine_physics_process(delta)
	
	#If you just have move_and_slide on the move state,
	#it won't update unless you're moving.
	#Movement component must also be active
	#if move_and_slide is only in states.
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().is_in_group("Enemy_bullet"):
			collision.get_collider().queue_free()
			die()


func _process(delta: float) -> void:
	_to_state_machine_process(delta)


func die():
	velocity = Vector2(0,0)
	sprite_animations.play("explode")
	deactivate_state_machine(movement_state_machine)
	deactivate_state_machine(combat_state_machine)
