extends Node
class_name MoveState

export(NodePath) onready var player = get_node(player) as KinematicBody
export(NodePath) onready var camera_arm = get_node(camera_arm) as SpringArm

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
	return Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	)
	

func vertical_movement(delta: float) -> void:
	player.velocity.y -= player.gravity * delta
	
	var just_landed: bool = player.is_on_floor() and player.snap_vector == Vector3.ZERO
	var is_jumping: bool = player.is_on_floor() and Input.is_action_just_pressed("ui_select")
	
	if is_jumping:
		#temporário
		jump()
		
		#character.action_behavior("Jump")
		#animação de pulo
		pass
	
	if just_landed and player.velocity.y < 0:
		player.snap_vector = Vector3.DOWN
		#character.action_behavior("Jump_Land")
		#animação de land
	
	#if not character.on_action and abs(player.velocity.y) > 10.0:
		#character.action_behavior("Jump_Idle")
		#player.snap_vector = Vector3.ZERO
	

func jump() -> void:
	player.velocity.y = player.jump_speed
	player.snap_vector = Vector3.ZERO
