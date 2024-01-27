extends Node3D
class_name PlayerAnimator

@onready var animation: AnimationPlayer = get_node("AnimationPlayer")

var on_action: bool = false

@onready var player: CharacterBody3D = get_parent()

func animate(velocity: Vector2) -> void:
	if on_action:
		return
	
	move_behavior(velocity)
	

func move_behavior(velocity: Vector2) -> void:
	if velocity != Vector2.ZERO:
		animation.play("Running_A")
		return
	
	animation.play("Idle")

func action_behavior(action: String) -> void:
	on_action = true
	animation.play(action)

func _on_animation_finished(anim_name: String) -> void:
	var action_condition: bool = (
		anim_name == "Jump_Land"
	)
	
	if anim_name == "Jump_Start":
		animation.play("Jump_Idle")
	
	if action_condition:
		on_action = false
		player.set_physics_process(true)
	
