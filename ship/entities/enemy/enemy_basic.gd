class_name EnemyBasic
extends CharacterBody2DWithStateMachines

@onready var sprite_animations: AnimatedSprite2D = $SpriteAnimations

@onready var movement_state_machine: Node = $MovementStateMachine
@onready var combat_state_machine: Node = $CombatStateMachine

@onready var move_component: Node = $ComponentMovementEnemy
@onready var shoot_component: Node = $ComponentShootEnemy
@onready var shield_component: Node = $ComponentShieldEnemy

@onready var data_store_component: Node = $ComponentDataStore

@export var bullet : PackedScene

@export var move_speed: float = 100
@export var bullet_cooldown: float = 0.4

const bullet_collision_layer: int = 0b0010


func _ready() -> void:
	facing_direction = DOWN
	
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
	
	active_state_machines = [movement_state_machine, combat_state_machine]


func _unhandled_input(event: InputEvent) -> void:
	_to_state_machine_unhandled_input(event)


func _physics_process(delta: float) -> void:
	_to_state_machine_physics_process(delta)
	
	move_and_slide()
	
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		if collision.get_collider().collision_layer == bullet_collision_layer:
			collision.get_collider().queue_free()
			die()


func _process(delta: float) -> void:
	_to_state_machine_process(delta)


func die() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	sprite_animations.play("explode")
	deactivate_state_machine(movement_state_machine)
	deactivate_state_machine(combat_state_machine)
	await get_tree().create_timer(1).timeout
	queue_free()
