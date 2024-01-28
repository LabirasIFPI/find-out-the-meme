extends CharacterBody3D
class_name Player

@export var character: Node3D
@onready var move_state: Node = get_node("States/Move")
@onready var camera_arm: SpringArm3D = get_node("CameraArm")

var snap_vector: Vector3 = Vector3.DOWN

@export var gravity: float = 50.0
@export var jump_speed: float = 20.0

@export var speed: float = 7.0
@export var rotation_speed: float = 5.0

#@export var player_nickname: String = ""
@export var player_id := 1 :
	set(id):
		player_id = id
		# Give authority over the player input to the appropriate peer.
		$PlayerInput.set_multiplayer_authority(id)

# Player synchronized input.
@onready var input = $PlayerInput
var player_nick: String = ""

func _ready():
	if player_id == multiplayer.get_unique_id():
		camera_arm.get_node("Camera").current = true
		input.nickname = $"/root/ConfigsPlayer".nickname
		input.skin = $"/root/ConfigsPlayer".skin_selected
		input.level1 = $"/root/ConfigsPlayer".level1
		input.level1_correct = $"/root/ConfigsPlayer".level1_correct

func _physics_process(delta: float) -> void:
	move_state.horizontal_movement()
	move_state.vertical_movement(delta)
	
	move_and_slide()
	
	rotate_character(delta)
	character.animate(Vector2(velocity.x, velocity.z))
	if input.nickname != player_nick:
		$"Label_nickname".text = input.nickname
		player_nick = input.nickname
		if input.skin == "Barbarian":
			$"Skin".add_child(preload("res://src/scenes/skins/barbarian.tscn").instantiate())
		elif input.skin == "Knight":
			$"Skin".add_child(preload("res://src/scenes/skins/knigth.tscn").instantiate())
		elif input.skin == "Mage":
			$"Skin".add_child(preload("res://src/scenes/skins/mage.tscn").instantiate())
		elif input.skin == "Rogue":
			$"Skin".add_child(preload("res://src/scenes/skins/rogue_hooded.tscn").instantiate())
		if player_id != 1:
			if get_parent().get_parent().name == "Level":
				get_parent().get_parent().update_tile()

func _process(_delta: float) -> void:
	camera_arm.position = position
	

func rotate_character(delta:float) -> void:
	if Vector2(velocity.z, velocity.x).length() > 0.2:
		var look_direction: Vector2 = Vector2(velocity.z, velocity.x)
		rotation.y = lerp_angle(rotation.y, look_direction.angle(), delta * rotation_speed)
