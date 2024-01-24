extends Node
class_name MoveState

@export var player: CharacterBody3D
@export var camera_arm: SpringArm3D
@export var character: Node3D
@onready var player_input: MultiplayerSynchronizer = get_parent().get_parent().get_node("PlayerInput")

func horizontal_movement() -> void:
	var aux_diection: Vector2 = Vector2.ZERO
	var move_direction: Vector3 = Vector3.ZERO
	
	aux_diection = get_direction()
	
	move_direction.x = aux_diection.x
	move_direction.z = aux_diection.y
	move_direction = move_direction.rotated(Vector3.UP, camera_arm.rotation.y).normalized()
	
	player.velocity.x = move_direction.x * player.speed
	player.velocity.z = move_direction.z * player.speed

func get_direction() -> Vector2:
	return player_input.direction
	

func vertical_movement(delta: float) -> void:
	player.velocity.y -= player.gravity * delta
	
	var just_landed: bool = player.is_on_floor() and player.snap_vector == Vector3.ZERO
	var is_jumping: bool = player.is_on_floor() and player_input.jumping
	
	if is_jumping:
		character.action_behavior("Jump_Start")
	
	if just_landed and player.velocity.y < 0:
		player.snap_vector = Vector3.DOWN
		character.action_behavior("Jump_Land")
	
	if not character.on_action and abs(player.velocity.y) > 10.0:
		character.action_behavior("Jump_Idle")
		player.snap_vector = Vector3.ZERO
	

func jump() -> void:
	player.velocity.y = player.jump_speed
	player.snap_vector = Vector3.ZERO
	player_input.jumping = false
